Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E243D4EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450389; cv=none; b=fQaTKENSQs7jWhPM6TGk0P/+9dmu4Olkz5fWWpCH1d1X+RmBGoMReZzTea2GUDJ2hndVbaNe3roxINhCnexH/HuKnJhnExcDex/mbBadGvj9Q+agdKeI5pYih7b25sAd+iyhTjE2yAOR6sRm14VPzgp4MTvLv6EVCTTqxlGT2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450389; c=relaxed/simple;
	bh=EB8Tf3Jr+nfU1duy+Fw5XFO+MAHIiX6blqKSfX9HO+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgobyUGpibxflgIEFYi1jrWhsHc/9dvl8iouTCnXGWTtjXPgUPg6OQ9ISuj64cbb/g+fwbBt0HFi+KylSlQ9qaK1aHh//TvRA6SP2z0UGR2q2kDPejpk/tnoeDFTLT9uxRNIRLkRf7HFDisDEUJs5kRNa1JT4iddqR5d/dmXJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gevbjqn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X322UzQy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gevbjqn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X322UzQy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAM65O1490384
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjVh2mbe4zgDgd6xVbPkoaDHlBtF5BuwqqfNQH98Y5w=; b=Gevbjqn+wj1EQAg5
	zrHVP8kPHousOtfDqM7orDiCn04Xf60+uEf1P4iD70OeuuHLf7/7VaJ2m6DfxfSZ
	gciPAsvMwGAMdel/vq5V71+uITa1+J/SiwAujpdWV145sReoSsYuQvHXlc3W2fzT
	G+q7jTj9mJv+7ncsDJeViNJE1S3BktKdIfCTPGbjOcwUzIpSWYEAQkoRQtnwlFyG
	GH3fN/G3QpS+NTsnDls8zGvJDfEQHEs9ICH0KcMWiCDn7q4Mm2hjmaYxCz0+SohF
	ipobQIZ+M9WaOaZe3PwB5pPp9l52Wce0+Txjrd0ijWuW7teFwA4/9zLnOlkr94UN
	Ggccqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8mam0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:13:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3353614a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786450386; x=1787055186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjVh2mbe4zgDgd6xVbPkoaDHlBtF5BuwqqfNQH98Y5w=;
        b=X322UzQyW/wx/UgO4ngeG4E8mY8uvMwMdsH7TV2a4/JP2J72I/QZ86udxdogEHWbNF
         tJYGDhDRLI8IYJoKXR3/Mh5d12iWvm0f7etMeVV30FiZ+Vc4ddd4NcfMBxTtDwKQe60M
         N8J52YxpJGt+HHauPlIi/ub6FFHX4w6KYFxss2lEX85yfLvIOwo/WVYd61Uw4jlr6hDm
         YdlKZOVQBOj50RAdarx1IPrp/wEAQVPfgUGCZ5rSbdxyQMuWOH5XN4F21ur/5qf0WF/s
         I+hsWFQcblIG6HuZP9SKKsBGMzXV3LUTzrpwHnMDZ/wkv296M5kMSWJUGM4CMHoyRIN/
         kx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450386; x=1787055186;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjVh2mbe4zgDgd6xVbPkoaDHlBtF5BuwqqfNQH98Y5w=;
        b=BXithrQ3SLh5YOeTbpxWaSAor1TLcSljHhu+PBwuqz53Bya04gfnwERcYwBnU1SewW
         0FT/8bpFywwvQ/KVuggDF8mqNRtRqQfuu+KcqCj6MKDA2TFcq3Wm6n+CA5qcTcCM9lIT
         VXFGhntltXH99yk53xXc1H+dChNpP/5cN8BTrrcpMb41LiFrAyqlqdnqYvWT1kZrbCL9
         sWNYf4O21+VbqhCV6+Ourc9UvJbXaEFUey1L8buCiSa+POjLGjRb1KMvXeqmF4Z2kL8f
         lOld/IWTwMfq2FyjavJLwEnxVTwmi15cnDZ6nRwIJC2I/Q2F8Sz1VfAGj63RoYcCevaL
         dXDA==
X-Forwarded-Encrypted: i=1; AHgh+RrAeWpo9s9LrirJC3A+du8alNvzW5kK0lzPg/PnkqeaU2StwH4cj0aWWZLso80fH1fraAAz986mYLJNQjhJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJ4Avfq/8+5/Zs3Y9lrbeoMJD4IrJRmvbRQ5fHDjKwCIurdSr
	ddGdbUVfxcxNOTsmionlSIcaXYG1wdwxjsGrqtqVpDX83eYYUm/jw5MdMhGcmgJriAdkhIEuJTn
	Bq5h52U/rPaCx9L5g/c/IgMUc47V6xL4BblCj/fRaSAeaMBFZl+TAX2D+BqCpGZbO+5/E
X-Gm-Gg: AR+sD13egJDDz5wD3Brl04EF68cx06IAtUtbkXbggwUlPYAymg1vcs3g6KF25ZdMv0U
	XHsqPXifLEQPHwp+/5aCdagxsrFEOFUtEgt+JQ6f/w4buhZFy4KdNOZbYS4LO5AfUU5vWATpALZ
	ZvMLA0MH/I54ScafXzd0ujiC9P51Rx39KMFEE0L3ius5gN50mMnG81DMUyOywy4y3NRuoMykNqc
	uH79c3eddAah9fYF5hpvmNe22Cd10pQXVPyjKd8Hl1LfTVU2PRFUYCEkAap1lSJe+zk0fbk+jal
	MjX+E2jhcVoUk1bZj12QKwis9CzR6vK+VtU2UAiMcogiA828u8Kp39S/vkBCJjhEfbJBLwpR5mN
	R4i/uHAsavCsFiOU4p0px8ufOkD+oy1sthgKI4CyHnlfz/tDQDXc4p+kTZZ/La+WRx6jXu0rNvZ
	l+4hP03Wi9SWM80qXB
X-Received: by 2002:a17:90b:1b41:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-392ec617522mr2761268a91.14.1786450386296;
        Tue, 11 Aug 2026 05:13:06 -0700 (PDT)
X-Received: by 2002:a17:90b:1b41:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-392ec617522mr2761202a91.14.1786450385744;
        Tue, 11 Aug 2026 05:13:05 -0700 (PDT)
Received: from [10.149.77.68] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee3084e9sm2004208a91.7.2026.08.11.05.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:13:05 -0700 (PDT)
Message-ID: <37d1d448-13a7-4bc5-bf25-d94c985e190e@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 17:42:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 0/4] arm64: dts: qcom: Add SD card support for Glymur
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwMSBTYWx0ZWRfX9pxvYKWqlJUP
 OMOXcPsfaKxFLiSGY3GeUZrqBYdVLNSJuJk8stMeMAJSGY6CESh4cDWidVfaR3ZVhozj9nCp5ot
 8QYWdwQlSj2/hINg3hLSitX2sEgvHcI=
X-Proofpoint-GUID: 1CqkrIpYy0bREH8amNRA56qMR_LHnjee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwMSBTYWx0ZWRfX6S32Gu7zKKpe
 J8WjCzB1NXCp7DbsVVYUcQUbU8ZUCpLAGDdY8Kk0EzC21lxacjfLOFOLeFY4SpgPDz/HHGBCw2f
 gvzGAsycCyWf+Zy2F1L1K8fxZ2QLrPlyeG8f6SjoRdqJoxju1OLFj1MLDF6f3sRLsNNStyBxkQf
 SCjkVN3UoA/m3bHfKeZFQoYCTMomkrTmjwQSsGmyiaywADu/mAzh3Da+o3X4mUQzi464ZFP8w1N
 SUXhGz7bfUCZDjAoOe1YzWld+D+ZejeMpu2xdb0hzAaOWWn0CZtZdvg74yS2OJ/tdpsUPn7wkNU
 fB4jYMowBMnNhEEKQ+t3bYr8TmfeaqeaQf1PERX4UZwqpHZSZCF8ttgjmra5qNH4sUsfJ2+HgVo
 lYx49bn2D2tBpJ1B1dCYZ+bNxLOPAJcHLu39KKHSuWv2l5Gsh8Kt7UVRuYNrEtLeml27ourOrjA
 yFDozy4F1wCjs+1ZmEg==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7b11d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CNsRCP18bEq5JKE3620A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1CqkrIpYy0bREH8amNRA56qMR_LHnjee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110101

On 7/22/2026 7:53 PM, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Respected Maintainers,
> 
> This is v4 of the series to add SD card support for Glymur.
> 
> This series adds SD card support for the Qualcomm Glymur SoC and the
> Glymur CRD (Customer Reference Design) platform. The changes include
> updating voltage regulators to meet SD card requirements, documenting
> the new compatible string in device tree bindings, and enabling the SDHC
> controller at both the SoC and board levels.
> 

Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

> Changes in v4:
> - Propagate Reviewed-by tags (Konrad, Dmitry)
> - Update the commit message for dt-bindings change (Krzysztof)
> - Move the common nodes for SD card enablement to glymur-crd.dtsi to be 
>   leveraged by Mahua CRD platform. No functional changes made.
> - Link to v3: https://lore.kernel.org/all/20260706141346.4180348-1-mchunara@oss.qualcomm.com
> 
> Changes in v3:
> - Collect Reviewed-by tags (Konrad, Dmitry)
> - Update the commit message for dt-bindings change to reflect the
>   purpose for the update (Krzysztof)
> - Link to v2: https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com
> 
> Changes in v2:
> - Rectified the iommu sid mask notation to hexadecimal format
> - Updated the power-domain corner for 202 MHz frequency as per the clocks plan
> - Added the BCR reset capability for hardware reset as required during the init
>   sequence
> - Reorganized the DT nodes as per the DT coding standards
> - Link to v1: https://lore.kernel.org/all/20260610111508.3941207-1-mchunara@oss.qualcomm.com
> 
> Summary of changes:
> 
> Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
> the Glymur CRD. Specifically, it reduces the minimum voltage for the
> VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
> increases the VDD supply (l9b) for stability.
> 
> Patch 2: Documents the Glymur-specific SDHCI compatible string
> (qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
> as the fallback.
> 
> Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
> configurations to the base Glymur SoC device tree.
> 
> Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
> regulators and GPIO-based card detection.
> 
> Testing: Verified on Glymur CRD hardware.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Kamal Wadhwa (1):
>   arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
>     for SD-card
> 
> Monish Chunara (3):
>   dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
>   arm64: dts: qcom: Add SD Card support for Glymur SoC
>   arm64: dts: qcom: Enable SD card for Glymur CRD
> 
>  .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 33 ++++++-
>  arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
>  3 files changed, 120 insertions(+), 5 deletions(-)
> 

