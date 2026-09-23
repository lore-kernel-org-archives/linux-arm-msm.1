Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8848A2BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160407; cv=none; b=ee6QCy3CIXmdXgz5GgqKYI+v1jl7wP3PeN+6T6TaXmlh3UH4VrJmXramdWNLnDZ+2KKDdPMGNTh+UT4yG66LnomiXWccSiVZkgYUwY2UzeHGVJk2wfTIZqoiihfLp0IZSkTwmZPSAQUhTpWN07EKNURg9JQaH70MHLwR/zFylmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160407; c=relaxed/simple;
	bh=cKkkpGEoKfOZWFBzQQ6wRz7KXQBaflmF0Q7/j0nrHBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNLxHxJj5BUBsR+19jiF3G7GNypHCZzSzmM1IRkXaDx7gXg+c91z7oFRZaKDGY21zPGti2PGG0EVKhuq+Efq/jSHEO1LULdvB2VzR7mSI3LAKoAplt7x0VR+NCtKgg+j0/1WW4TajVg6fbgWFG6+xr9z6/mQAUiHq90B37AJXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XxG+QwEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Noncwl3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxG+QwEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Noncwl3i"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3flo1623639
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4Pmw+R4Yefp0B3RZXXRyYW4ShTNLBgVIycZMwnKKsw=; b=XxG+QwEAo6BXs4F6
	YrZAF0c8f2TTjOhK8egXbZc3lY/jVPQHnHIeA66thDbyVAsy9jhUOqHZ2HQPXHHs
	+xsHU/aG04YReCArrMcHxxFK0OAT2Pg3j1WD4OUeGG7EpU/v7Ze/Oo2Pp4X90QkY
	yeMw8pEQgzK7HSG2qIcCCd3EWgTP29uGUKbkp+fweFo9K3yXuKk3HfCRkzrFuuRr
	BQdS4Et+OcyADg8ovqaMiLLkK473qrj4ccTeR8ctV0Y09YtKth7HhUSHMsmpsrdM
	0nD7a3TtTkOe5RLeQtMdCUn2O6qMo/zKIyTT/JtILYz6Rf3mei0ni9sJvWiq7P7H
	RH4pPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3fhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:46:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1128805eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160388; x=1790765188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4Pmw+R4Yefp0B3RZXXRyYW4ShTNLBgVIycZMwnKKsw=;
        b=Noncwl3iR0mGS3NzJJCkUFhMHDE/D8K+CCljg60HcuNxCfAqLBJ/QyxQ0NveIRFtJf
         prxrUMfkDduXWhcg1ARukVU8kE9SrqnxgSNwcM07nre2BvggkUwFWTg8oa5l/aNWk1aM
         Wsp7/kLVNnNNfz5/GFxlXLK7llgsn4LNBe3fO4jryAf40mv+z94p2Dr3DrpPareea+BE
         jOZv1/PPyC/wSwPFGCqWLDzcGCxR1DtJFIbhOD7DtTJbGhgWrjtZTfJXeH7SkXgtXcmD
         RRj86qAU2u3lETa7cZzNdH6d25Wt3d/obJShrZC+ztz579hdeJLGSVdaPWUcw0HYsPFd
         1DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160388; x=1790765188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4Pmw+R4Yefp0B3RZXXRyYW4ShTNLBgVIycZMwnKKsw=;
        b=BVpENhM/FfJehLySCCAZUKKV2UlAfQmI9Y8M01smFsv7KUyrGy7j5jiz+/yebDUh1F
         QBswaLDchz6xNepyKp+4BAsOZcUNqriQ1o5m4jcXFhzEM77ts+/ZB3h5o43LMW06qAbl
         rNwqmT7jddeQaI1d1urw4cUtIo19+BWCZSep/9rauvTn6h9hyKPBIkbMRRALgmxgiqN1
         JoMohgbNOrXRhz5k09dXEG7lEWIPvRazvTFR/nw2CpcU1v1/+cLAsy3RWy2mm+FfPCLM
         BAkUun849GjATG+GyQE4H/vT0mQmBcl1xaMlLwAkNBptH/fNpbJAFXxKi5lZbk6SYTD0
         tamA==
X-Forwarded-Encrypted: i=1; AKwUvBykhw05JZmJ6K3ZM+lBnZOSNmu6JA+EgxbwL05/sa5b8e3RTBs5rdMpK+GspTfrCPAqxRw/FBCYK3hSoeDZ@vger.kernel.org
X-Gm-Message-State: AFuF++nqIGG5s0GxRHl1hhNaY7O3n4lPeSqmnyebHhWzcO6Uq5C8Tizb
	gezxFQwlrIMHVr0XYsyM2WiMiXEP4K1EuIXhKNG7Sn/4CabiokrBl84KKribO47kBTMUBLt4lA/
	LnFpKV9Cz6yuAqFGU3BCep3uu77NXfolgdhqylOsqmO8l+Yk3sI4jWdhgnXCpa6Gjr/uN
X-Gm-Gg: AYBFou08v4UQLw5bXbV+iTcK2AFZlVDuHU/QNf2echGccttQNrp7YCKQwzHsiz5bj9S
	okajqYDEVM2An/unjSRTUSz4iq9D9ocYB7i05BiVyyrXvb/36ViV+s/0Yj7qwPIQJ55IgRJV4R8
	s91Kc6TH94+XeU5D2CrfihuOdNW34ogmyMg1m58qh0P7EqbWRT9HJbvcvahynObHSJfmg+f9hpA
	Fne/WASydeAIaSHaw5k/2dOj6/7hXRGlsZXC3NNzSaQ+x6RQMrbVdyFs9FKbjJLHlJPzY0FdMz/
	5lfXFmJ5qbFxYeQrXCY4kfQiElfaYBYbrdLRe5y6BVcJDfCL57LmhsE8J+bdVvy2Ty2BYF5c5wN
	8fsxaxieVfK3bZ5lB3Qd6xCXd8+IrRn/ORfGOLw==
X-Received: by 2002:a05:7300:7949:b0:328:7033:9b8c with SMTP id 5a478bee46e88-33e8bc73e7cmr2262088eec.6.1790160388188;
        Wed, 23 Sep 2026 03:46:28 -0700 (PDT)
X-Received: by 2002:a05:7300:7949:b0:328:7033:9b8c with SMTP id 5a478bee46e88-33e8bc73e7cmr2262049eec.6.1790160387564;
        Wed, 23 Sep 2026 03:46:27 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm13419439eec.18.2026.09.23.03.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:46:27 -0700 (PDT)
Message-ID: <7ef413c5-a9fd-4e75-bb02-b3d7f74c67ab@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:16:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
 <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w4idnioZ3fTX9p7VhB_8AGHwR-vcCNIT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX6mK1hmrX4QC+
 mWMce1+GFQv/c9fSu5B+fzxnWfDUBcc9eLn0QXWqVae047mIyd/TEgkq+lL1B1Hg1SyzxJa/Ger
 aVyDcmsqvjFnOZ5UhFN5/bVHMLPdBdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX5itgFjm/EuBr
 f1ieNe+X48RRh0rqjSOKvm88ISsA6nIyab7MSQ50Kjj9XfIAR29D1OuoAakC9VaIzDS5aFRhc2A
 LV6kk/tm7xduM5SAqnz67IqWxYT5Jw8M9c9Fa5R94WUBcc7Wg4xInedygFClvnO3vkNHSoA11LX
 nTmUSzCfDG34gftldQI0qw3pn4QCaOH4FQKcPZ/EodNIAUD2tbQE93nnPwO4Pr1aZ8IWdJR2zqP
 qo4ZkYd8lu3nUWdra5gy5oF8OABug6KQMdWv6b1gL4t+5yY/hujkfNWhkkb4UJRcw6MPX1kOqo5
 EnzchTc/mVarBvaE7dxACKEE+1Ly5RI5diwZinjejI4Qx0ji73jY9zBmdcseVgXD8fpdyceZ54q
 U8NqjYSsHLOQymlUGall4BHfQP1Zd2y3FkszrIYMjnAwmIsxrf6fAK4mChnvq4E6kWoj//B33GV
 w92dT5N35DU65zYMaXQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3ae05 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C3SnZ9t20SSjsJMBzhEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: w4idnioZ3fTX9p7VhB_8AGHwR-vcCNIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230042

Hi Dmitry,

On 9/22/2026 9:33 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Qualcomm
>> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
>> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>> for DSI PHY PLL stability.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm4125_l5>;
>> +
>> +	status = "okay";
>> +
>> +	panel@0 {
>> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
>> +		reg = <0>;
>> +
>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +
>> +		vddi-supply = <&pm4125_l15>;
>> +		avdd-supply = <&vreg_disp_p>;
>> +		avee-supply = <&vreg_disp_n>;
>> +
>> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
> 
> As far as I remember, your panel_bl_en enables an external regulator.
> Why is it not described in this way?
> 

panel_bl_en is a Qcom's daughter card specific platform signal , it does not feed into the panel.

It is a board-level GPIO on the CQM EVK daughter card used purely for
platform power sequencing.

Adding panel_bl_en as an external regulator would be misleading and incorrect from a hardware perspective,
as it is not directly going into the panel.

for the CQM EVK, the backlight is MIPI DCS driven and panel_bl_en is a
platform-specific sequencing pin, making pinctrl states the
appropriate binding here.

Could you please take a look at earlier discussion we had and let us know your thoughts ?

https://lore.kernel.org/all/29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com/

Thanks,
Arpit




