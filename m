Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C324078CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165722; cv=none; b=fV5WBc9ek5V5ck6PjUurRWlzfzk7u7qfF6kOB3vocyrMymOYwWJLNhpEp/lZQyUSH2gQrXURHwoj4jc3tGQ7KDUk7Lz4m9FgOTijbxi0GI/EgFcAJuNKbgU8N3vTibGRoyq3pdsB8vmRrvt9Tfx0pnbyqBCe28xpBny8Ac7aLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165722; c=relaxed/simple;
	bh=JF89pNt+wExytSZXMxkXOZVOBdOMKxbaW21qgJgND1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkGwVE0DGknBhjpbyvQngh1R2vBAIgiV5sIsMkAxsypGwh/o4G1Dk3V6Sp14CdK8u+/eFCixeWdV9vgmw8bYPhz4oeNZvKiiyuLgCybFv4ImCsE+NzrpUaynkuuCuiVlLafuRMQhIwYVRHgqhe7ZVLOj6K2f0ih2MlqYfSxnnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTcH2Udt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMcLvAqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTcH2Udt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMcLvAqx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHpllQ1557220
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 18:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p8I/883i+Fw2SDGjY7bBs2bi
	TmL4wubFWVmWaBFZXfM=; b=dTcH2UdtjpVkcr2FlTbDXTwnRlPrQIr9ZxeY/xbD
	UtHWIUm7DQ6TTVkRL//18D6IR45UwtJuCs7EQkWtuNyLD5F9Ojvl49CiExVYHl+7
	zYCJU1gzLJyxUmUFQrD0tn+DyJwTBba4I5Rr5BXDdlGsuiRYmtio7LF0/i43cPV2
	+DguTxuN6bTCA7N+5eBIQZvXrNRbTBctIXu0FVhd+2KFqnO+VjrCL4YjWA8lzMSs
	2+MfeHRa2asD/POIXXvxO1zelaB8+DSFIg4O4ChtYGA3hnvu3Eo48kJRC8An8WXr
	GuGFZQ+kP6DG7QtpNQWvl2jL2dKoIVAyI6jy9iNHDMWcBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj152j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 18:55:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9368f2b7b2bso153409385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787165719; x=1787770519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8I/883i+Fw2SDGjY7bBs2biTmL4wubFWVmWaBFZXfM=;
        b=CMcLvAqxSxK9WVKCSRpgZEuo54YqxHlxMw0dCuwdV5XftNrxS+1RIOnwRT3iZIThJY
         Xwtcla8qhFa7ozYolrPhvtb25jHwgT9c3MbbMrfUR+Pka+orliOSbxJdO3zP2GLokTBa
         HTgqxKkpu2sQnpEyQrmtSEKbds0XSq8MyELQAq50XYA9UlCbyL6GtSOEN8FxVgKfjyMj
         cjyIt5iWa+b8D1LvSQ7TOx21awz8AdbCV35UBKG4Y2tXlLXGdCQgrUWd5J9r0UdzjfgL
         XxYG/27NWpDZLKL49KND8Tz7mjJTMUESjsluJCVRuTI8sv2vpMBpktRNLmUcWCtp0QCN
         AUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787165719; x=1787770519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8I/883i+Fw2SDGjY7bBs2biTmL4wubFWVmWaBFZXfM=;
        b=YfKx5dPUSxShCvZ1gnPjGJ5AxYxnmlPJcYQbf0yIwFMrUT+vV7EkNiyEiEai/xqMBW
         KvxMnLxJCOMgxmKgyOsOW4voo8w1LGpOTgv2nqAKyq1jG1b2d9HHvy7LB7UdKDYrlW1/
         pdVXlyVsP8jKjLNOUfz7TDLlgK40S32cm6Zq5/ruZyTXjFovDzUDjFAlEY/qY9/vrB31
         w4+JVhlFuyI6Li6xEH6isbjscmuQKZMmcCpVwQQoqxit2JypMbK6NlBc/RWSDGHtYknB
         XY19TyDUrWlyXegLMS266POVDUE7UoJ6MJfXvAjN9tw62p8Kd/yVW31pfyNgWdZn0uqI
         luYA==
X-Forwarded-Encrypted: i=1; AHgh+RoG3XVI4q6+mp3W0VShKyYOUr2+2JxxjS7X4bvzy/Y/vDEz4brst7WACdKht0InZLg2FARhGAEbxkQGN+da@vger.kernel.org
X-Gm-Message-State: AOJu0YxTf7fLDAKQ+oWAupTIWQSsNaDWU2V7/EHgb2OmTLe2tQRtz0WC
	pGqsKyAn9m9XQsPNEEA5DKq8XJZpcXIQcGuLJtrpi+gsMYsfablp2PhcpjvDeGYLcqW25+Rctji
	ntyQPxsPS/RBi79ZEpv8yonR1930NeAcod63lVdgDssIEAhstnRcTWalhPh8k3D3KeUcv
X-Gm-Gg: AR+sD12VxBbV941aOA3vJNkknM09qQoQwn5iljqExLquhPWMpu+tehwV7Nn/qro8woe
	zSnRhf5Ua6Xsa5UbaoNORGg00P/xzA6Ni3m1Gon/I5IAm3KhZP1TAB/Uss2ORA4Zh0SHC73p7GN
	4SOyofWcxqLhymyP5doq219vbmgpfzjRySQ47qxNBD6EopUOavHaHzmIftqA0OybvlI/XXeeo0g
	AUiBoVvVNjI31IkEqFVZj4TvPG3qJN3WZ9eWdednqZOapTYlcfgmM4iMvR6PetuYiKO9uC2R+7W
	ohDfieGWVuuwiR8KE6B3UPuQVp712CTPoT5onrHKxW33/VT7V1MRAF7e/cCUQeuBNdlRKsBcDxJ
	Vr8FG1zYkkYR2CJs=
X-Received: by 2002:a05:620a:468f:b0:915:9e84:85d1 with SMTP id af79cd13be357-9371e2ff406mr696202285a.23.1787165718720;
        Wed, 19 Aug 2026 11:55:18 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:915:9e84:85d1 with SMTP id af79cd13be357-9371e2ff406mr696195185a.23.1787165718035;
        Wed, 19 Aug 2026 11:55:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b80a5sm7640526f8f.24.2026.08.19.11.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 11:55:17 -0700 (PDT)
Date: Wed, 19 Aug 2026 21:55:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: lemans: Add PSCRR NVMEM
 recorder node
Message-ID: <yh4d3236iq4kjp5gumj6sj6b2dbiwjbmyywiayzbm4ul2mqjr2@hu3ddfqxfftr>
References: <20260819-pscrr-provider-v2-0-9072383e0f4d@oss.qualcomm.com>
 <20260819-pscrr-provider-v2-4-9072383e0f4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-pscrr-provider-v2-4-9072383e0f4d@oss.qualcomm.com>
X-Proofpoint-GUID: 0fcWwvbsNTmSUzXnbxvwZXTCVK1CxLQ4
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a85fc17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DCxrtmPwReth02PJCqQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE0NiBTYWx0ZWRfX0sEpYuvP0hIK
 BG8TLAYl28WDPFleEnyeh68HW1to8tMSe4QGiAghByy9dX6RgFgsdwaEEVm9TvEkfUJ6yuXqqOo
 2jT8LaaEtp6UiGG6tFb0SEdKhPjwrVGA/+shVqrqVPu8Y30ZcG0PY5UnLqqXbjl+dAaeH5AJlJ/
 Tl8dw/iyPZ3CuOHbBS5eMT5z7bWVay2dA7ORVszrcKLS0bNnEgurylqgJOVU5qTbs7BETvyjBxG
 S1o5+N4y8PJSXnBBDam0b5xBqr31P7g4IaR+GWqNlEmBSTvCnHHwYmf8GKl6fEbM9F3w0B+w8GA
 eBzpjFVaS+gPOlPWBHYtBn28PNtA417qOuxQIPdYpt+FEPeeIMhj46X/s6g+rOIQ038VWY7ESVr
 cKQ/a3d0DxkvfNh2D0QcaupuxJEzpwJJR7ckldmqSmDOBFijLmLQXIE/LifCgepFBGP1wBYa0Au
 ewUHxDSQvyy3y6UkQMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE0NiBTYWx0ZWRfX9rGX+veeUPe9
 Mz1uQLI7ecaGRFi4J0/c0pQO8mWpNQ8jQiUHl7xWfFleg5HTnbrfMK4haHW7M8zBpfT4mhSA16i
 GK0HE3zMBmiV7BmS0R7Njnj5nDjQoko=
X-Proofpoint-ORIG-GUID: 0fcWwvbsNTmSUzXnbxvwZXTCVK1CxLQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190146

On 26-08-19 22:50:46, Faruque Ansari wrote:
> Add a one-byte NVMEM cell node  in the SDAM to persist the power

Super nit: If you respin, drop the extra space between node and in.

> state change reason across resets, and wire it to a pscrr-nvmem
> recorder consumer node so the reason is recorded before
> shutdown/reboot and read back on the next boot.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
