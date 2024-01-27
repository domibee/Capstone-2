// Tabs.js
import React from 'react';

const Tabs = ({ tabs, activeTab, onTabClick }) => {
  return (
    <div className="tabs">
      {tabs.map((tab, index) => (
        <Tab
          key={index}
          label={tab.label}
          onClick={() => onTabClick(index)}
          isActive={index === activeTab}
        />
      ))}
    </div>
  );
};

export default Tabs;
