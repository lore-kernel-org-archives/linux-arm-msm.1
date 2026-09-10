Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461FC25776
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031337; cv=none; b=HDpRQ2jEOc3fZ+Di7avvCvwQZwbRL3fWkZ9a8JbZgngnfjCMj+wqncTJKul/O2YlWnrKeo4Vcmdo0+0Ysfnssmc/3wd4UWLz+VmS5kPTZbr7HUcn6IShyg8cAic7yAKMjPdYnmmF0/Jx83wM+onk/KbRGlIPrEX9bIm0vv+ZZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031337; c=relaxed/simple;
	bh=8hucToE/S2WnPZso0gnJA+O2VAR3ifQB1yaddh/RmOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuaowwkvHysUK8+nPuwAY1eTNz5sCwIpBp0I1p7lyzoZAExJUiQPt2/pHdEbYq6DW+pO5XrMlgnSI2xJNqZz+jnhlDyfhHKpLTaImJ9Vu6sUQaI7LL7zBqzBvawyp2TjMt8Q3nc9RfIR88SrzB6165W9+4SxWqSSfNlYaxpOIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fol/YjlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxgYE1/1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fol/YjlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxgYE1/1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q01E427122
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2oHrCYelfY902R11wYb1NIL+eyiOUVA471Ms03DAnU=; b=fol/YjlMaFcZwH68
	/QxXyBXIj+Kpq+O8BRI4IayJmCyzzZ9VyqBwym64divFMmU5BJ4nFVl2d28qKyk6
	mZfkxPo/uwHKaN5ccCCLMl5rO62bp4+F7ODn64CmT3Rd2Bm2E+YFwVwy7MhXf1wi
	l/KlLzv9ykFoV03GHLJHxnLj58En3q4GdNS85qaKy7A8HPuIcS/cgRWjDU4JY6Ow
	vvvevd9SQxkRn9r7C4UChRh4JinSZCywSHJqwS5hJ8OZz7I9mpzFP0OYISE5l64X
	nL5K1hqOqLd3f4mRO09yFXW6yJzFYSsEVnHY9ocmUdv4JjabQLYzPOMFqEWQq2KZ
	CHFiVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd309f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:08:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so8589376a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031333; x=1789636133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2oHrCYelfY902R11wYb1NIL+eyiOUVA471Ms03DAnU=;
        b=WxgYE1/1wcQ5xODfGKFTMZbhMSVrZpq/I6AoFB9cIBtQ6aU/54X9RC0Bt3xUDRPI6K
         SHpwSeDoUjD7lE6DywgBLisxpGDNcG4VspcutERqLBe1RMzjLyFPmVqhX660cMbKXm4/
         KGps6W0onpZtKidN61FSFYJVfNZD3S321uNsq6dHRVh7K7pllQkebQiui9Ap92xc7A7t
         thFkeqTHN9M/8g8kX0O/jIg6AXbEY7aNM1FVvJd1+TBD0y0sUJVhJ8v4jQ6p0saBYwwa
         OvfRnm00IR+AiVC06/qF/4i6rShnGTz+/fBUSxNI50OuSeYZAikNCiK1aAeX5Fd06XzF
         SdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031333; x=1789636133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2oHrCYelfY902R11wYb1NIL+eyiOUVA471Ms03DAnU=;
        b=UdXi/mTffOe8A4G5KrcDefrhhyqzytvW/MPgz1HcqKjiiDjPdUW01UnJWX/ceQD+t+
         V6R6y/rZR4LB26BhpWI0JD2Do7vRFiJ1VZdmRBwr4pDNN4DiQkT6Cv6fFNp5Yf63uXTR
         u02914kHo6kepRMm+7hECShN4kdt0MQVrTGwYrIlxmDl3v2Ozg+rHmLJQKRcMa6DVjPD
         7XnUBlZs/zxfE7h6an0xz+wN/Jcb9Ufc3mjSlFDhfydPe37oFZZPrx2OhUnbPjX98gmn
         YEnmsmpAzT4ZCemPUMbUzvhTQyMi087mQ6Gj61ESqRztpee2a1p1VGAiErBRHEs1NQkE
         aqmw==
X-Forwarded-Encrypted: i=1; AKwUvBxyXlKzYYXUAnk7jGa3Sl91GhdjeG2xRR4h1LV/m28wes9TmEimF56JGb+ddOOBhrbU8QXw3wW5sUmtUUiV@vger.kernel.org
X-Gm-Message-State: AFuF++lhv98lPTswPsYVDqZifdT2ww9l5/wrDcYXoFD4fDER2AWJ11Jd
	h5sHf+kD4zUs/6TD88T1538ujiN/95NGJq3FjyYx8EX1KiKzeJh7pKByPw0v5+pQFNet/vgpPkn
	TR6GaVpVo9o/kw0eh69RdMYqI8CnkHo7eLSBUGG9P9xWLGt+Rqct7/p6/sz07ucJaus6U
X-Gm-Gg: AYBFou1C7DlFKz6/GCS0L6zeL4hPJ3AtoEMtFEAikLt8ycnjECMcb97cVIZdLb/wKUD
	ntC+ZzZa6q2IAykrgnX/0hgBCf41rqrDx9ZBdImT2pzpA9yjUPRARJ891tIIL01vLktSMtT6yXS
	GGdyJDIpVqg5cjPtRHcq1tpbRJD3pFGghwFF6q2etR5f7ZLvXZkQPeVe7Frt2lH7t6Gs8Pf5Y5f
	+fEWZe/SNI261PjMg4ftSQdxzIrAaWri7vZ9jI1De1kKBzAim3Z+NqrvnifbhNfrYY3Wa5gtFFc
	dJ7hJcGRbqYqbys6MIGQyigcLIEurZrRN119E5JlreFpYr0uMViusP05ayOH0o983hdTbm9gJEI
	V+Bv4wF1VlFGpnNMo1DQnlYjhCBg=
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr57669043a91.8.1789031332817;
        Thu, 10 Sep 2026 02:08:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1a88:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-39b2619138bmr57668977a91.8.1789031332372;
        Thu, 10 Sep 2026 02:08:52 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm26847186eec.3.2026.09.10.02.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:08:51 -0700 (PDT)
Message-ID: <c0b0ff51-e514-4483-aa37-a313755851c1@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:38:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
 <aqEheWi6OaJtJfDu@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aqEheWi6OaJtJfDu@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lOkOO4nXuOc0SmYOZK_c8N9u_vOR5Coz
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa273a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DBr2NRcRzsiujjGSwJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: lOkOO4nXuOc0SmYOZK_c8N9u_vOR5Coz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX2pmcI4afeaNG
 W/prTvQjxx3nR8z7uM627nGkwq+pQxO6UES98vB7cIqWzKttRK27vx8aOr8vyPjCLf+eS16BMov
 Ihthh2NwwMtKxK4/e62+OQTU4jp9aaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX39jn6Nrqyowu
 O2Xlhu4EzmTEuNk/OcYFzp2Uy3GTW4zFktmC+wharK1PtgJHS3sMPvqNWShvAURKPtV4vO/YA09
 TPoa11Sl+/07Ybeldh8lQ6HaiZyiwBIsowMf66HWSVvgHciFxwHwvTG30TYnBtAQFSi22OW6tsY
 0srpcd5Mzvf1wiGzwOWyFKzTrJ407dyLvwc7oxdurrurKW/mC3RL+xy4bC7HrR4cmw4Y3SZ4c4R
 +blPaiKMNJwIsHl0Z54N/Pbc6wVEnNh4r3cZ4WV/XcQ9F+ARU7spDR55L+zjJljvJUwZGO2n/5V
 S1Z7GFAFAohPWi3ZcjnQ8eUAhFDNNAy/8dAmHGtRLXzNAHfK/akPx+VPvWlsHhHXfaeyne4cef0
 fCgeZ7iTbm+UaUZXD3y3zIMMrzrwpyX07exEBAvrrtTnWpzol/nIldypGsPJU1VqXykqvQTTEGl
 2ghtw5fISUWf8a6pz1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100102



On 9/9/2026 2:36 PM, Shawn Guo wrote:
>> --- /dev/null
>> +++ b/drivers/clk/qcom/dprxcc0-nord.c
>> @@ -0,0 +1,436 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> This include can be dropped.
> 

Okay.

>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,nord-dprxcc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
> This include doesn't seem to be needed.
> 
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
> Ditto
> 

Actually our generators are common across clock controllers, so they add
all get added as our templates. I will remove for now.

>> +#include "common.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_AHB_CLK,
> The binding requires the DPRX CFG AHB clock in clocks.
> 
>       - description: DPRX CFG AHB clock from NWGCC

This change ensures that NWGCC is probed before DPRX, allowing the
critical NW_GCC_DPRX0/1_CFG_AHB_CLK clocks to remain enabled during the
DPRX probe.

> 
> But nothing in the driver references index 1 — not in any parent_data,
> not via devm_clk_get_enabled().

-- 
Thanks,
Taniya Das

