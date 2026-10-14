Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F42C0296
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791941042; cv=none; b=u+qbDaF2OTgnLHv1B46UrxvGeHTjj3RuYZk/zJWLQdJPgUxlM3n2nhtif9MP+wcvpBy9doPBuo8SwlTFvNIVtP3Cn8H8fcg9iqJmBHz1wgui+osdDzFhtsoYWOVvG9VtRwv/Ka6iHBliqfRiyfToo16/R+uhZWW/KqQV06fjrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791941042; c=relaxed/simple;
	bh=bME5i0DZIV1lF2NykRIiMJxtZ8bK6OAsp3vw9WaYnKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJQ62C+OY00rJvtBL/3SzFtvoTJbhBixQPbHXJJtczbH71EqBzPqFOxnPTpsv51SBSgkRW0NgFSUXcmQvZRNk9rmqgCRBjSQ0Uwg1/k+bmE2xZtuD6xG+uSjwgzK2T8R2r+8ArpBiPpe1Ad71Oa7/igzM105ANZJJff1WVy8DXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAWqs9Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVE/sWbh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAWqs9Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVE/sWbh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DKGoqL442784
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=; b=ZAWqs9Nku6EgdLWr
	O+52qKP98n4qtMbEHVbuz6r4yUh99KZ1p2ZTvHpqUi4KbwwqGgmCHfjjDjbsydvw
	81Z7y1Iu1p3h22OF9HEA6FsI+SHB6S6UUVxHFlVIRY2hb2AP9XribDpq7avCfbGQ
	2HTod1fCyoA0htHMwR/hz3LbVsMgXFnluFHDyvR9lWxl8m9ERhEeOJtn5h6X9OSX
	r5NAccZkKshiPWq8+TsW44CD2VejeAIr3s8a22Ed/Rb9BZmNGxNAqeIwQGBsjF3v
	l62ZSqBcj/XbhlFkbFBYd9SgSRw93OzrgLnPG5IWPbD5fCImNYzCgEinqxjbO/ZW
	PS/o9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71jxvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:24:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so4249314a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791941039; x=1792545839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=;
        b=kVE/sWbhvlkucxMsM79xnZXUo3UgPSrMAsCDNuVN4hfVLAQPUMwYBocZZEMjIhSDCx
         2GWf4QF+9Dr642C0zznxRRL86fmA1xwLy5OyApwao8YNOjWjZ/6Vh5W5EhpR0uf2Ehn7
         1QuJ8umTMY895p9JmXrIqa9n9m6AOOSh9GvEB73PhKcWt8ia9V6DDTqlBAfejErg8IdR
         oNUYIAVQFInFChVd3hjwW2gmXF9p+aguRE99+sH3UZ691XssQBWrmvmFzwsEBDrDP7IG
         73THUICABuFqTy24qvpE0gpUql72u+1x+WMiqMucXT7bsmtQdSwt6I5i3mmUjHG5SVTi
         Cw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791941039; x=1792545839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7QX4HKEy4Tb4JyJAP3/xQJsm2k5g56YQykmhLlZ9Lo=;
        b=B4+5UD895vJuxT4TLRDT5mJgHmaCBfGmAmEnpB1FJQNgNjzxQsB4tN3A9JHIJiYz5B
         fk2f3fZCTwJl7N21VJ+a24yETfoAr+JSqtcPuAF0TZqUV58XalRmN6lKxl7cgZaDbRQ5
         eXR8qjvBKW6cmYu6yImttibmLKDbAzublJobjtJ7jVoF6/9hSBhUGYh/CrFILL9Yg7aB
         Hp3/djF2u19j8+3aF66CLoUVCtcrkATSSb/+uNSb/m7zfeVDDtepW4YEY5MA7SSIby58
         jd/xB9E4ne8NKoDVA5mJbZEZ02w64DBGZJxWClzMNP3ekHzrRKFVRzexSxiQqgvpeIb4
         OK1w==
X-Gm-Message-State: AFq9FYJv4VXZdh+ZWIApmA/uj1DnDgj8ASDydxChWinSSEGnk6kJL3u4
	wywnAJfk/nMJSgvWc0LJwsF0hG/HxxzdBnzafKPqEl12I3amr8Psg43Hrfuu826LH8u6lQtIBbU
	lT1Kxfkxt75OLGT2iI8Qc13W9YfDYR9EBnLGbEYa1fpRfdtbQtkRUHqB6x4KWgTfE3cex
X-Gm-Gg: AYBFou1aMXEH/UJeP/QpFivWztbcrO0U7jEwnqjhXBNm1sYLLTCj1tGrfE5wzdbS6Rd
	nbxah5lNzyPSmtDfsAK/EviwbXEbaYXzGQHFYWWvLq0qQO6ArgNR+329g5xaVulV9TYTR4oeREn
	eCyyf3YaO7LYQGfOQrEU03seON2RbWvz8QE1HEnhMhmW/F87SC1E0KjgTKf4q+dZopauOtb3iVN
	rAwDylzBlovB/WlkW+QuynxVCvUAUMJnOThliyS4XTrdc+Cz+G5+4d37D2XH98xFeCW+HF9BqrE
	YizpE4DUsdwOy8ogVrK8XYim5PaeDXXCOablGngj1fIjadsTPK+AYE/KytmHq+LtmLWb43W9iz6
	J9zhvAZ2aWnGU0qzP8eKHXg5RpXVyojoi1CByH1N1sJIMuD6eMFg7eccB3cUkuZP4
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr11738491a91.2.1791941038875;
        Tue, 13 Oct 2026 18:23:58 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3ab3a3593famr11738443a91.2.1791941037641;
        Tue, 13 Oct 2026 18:23:57 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac678d2229sm616463a91.3.2026.10.13.18.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:23:56 -0700 (PDT)
Message-ID: <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:23:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6aced9b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ay6wXbw5ScRiw2kLOwEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: PLbYJatNlP5T24XujoASVZP3yQqeDhJg
X-Proofpoint-ORIG-GUID: PLbYJatNlP5T24XujoASVZP3yQqeDhJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX9AQoLM/QXM1/
 u59r8mDlWgxFw9S9fjQeaCOpkzlaU7/3DAJf8NvE7h+8iEUSE62C3UX0aZ541fE55U0zLiWk3z6
 5hbhq5SHgH9dwSOLyKZP0j9Cm8VDzvjnJVZxPGU3lihSU0Y6THK/Yvj/DJEHeJi0/3zL5fmkNAJ
 QJt6QU7/f11jphfvzyqmm1uRTVEf362nG8VMtkpTSzctPQcFiCEVTSA8kJYhmRZEKNgR3Z/7E0S
 V8waZPsvWqDVbihrpuO1wFJR6RXMyHYjF9L7wjB0hP4DizPklVXrz0u50S7dptne57aNhoWu/mj
 1IiSyTUG5y50phKdbOxW70F0AFPD7/Z5lfEIhwSlAPKd06EoGoRqoc0lsjtW3YLBP6KhTSmIIfs
 0RHKwjEb0wTmcYoOU1JWpFXCEllrJzPKTURmepisFO+qj4faEnuxrkZPUmBxPvSUelkZhSnfPbW
 MhY6cdqjPYP2Hqms1Yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNSBTYWx0ZWRfX+XfB/MjPu2ZB
 yd2B6ud2nh4aoIbhMtrpkRqmPailZ1ylrErzf84sCD2t76kGvIVqVq6Rwzx0bOpReHrKVV9GNOi
 a+iDVwLX/1pDy/YdlmTtOShGUi+0VuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140005



On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
> On 9/22/26 12:35 PM, Jie Gan wrote:
>> The APSS debug block is built with CoreSight devices like ETE,
>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>> ETM trace.
>>
>> The replicator, funnel and TMC ETF nodes in this block are physically
>> powered by the CPU cluster power rail rather than by a dedicated always-on
>> rail. Add a power-domains property referencing the cluster_pd domain to
>> each of these nodes, so their power state is tied to the CPU cluster
>> domain and the runtime PM core can power the domain on before the
>> devices are accessed and let it be powered off otherwise.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 567 ++++++++++++++++++++++++++++++++
>>   1 file changed, 567 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index 131fd2a16c54..d9313de53ee5 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -218,6 +218,110 @@ domain_ss3: domain-sleep-0 {
>>   		};
>>   	};
>>   
>> +	ete-0 {
>> +		compatible = "arm,embedded-trace-extension";
> 
> No power-domains for these too?

ETM/ETE device is the debug device of the CPU, no power-domain property 
attached to the device and the power management operations relies on the 
CPU itself.

I missed qcom,skip-power-up; for those nodes, ETE device should not 
check the power state of the device.

Will send new version to address it.

> 
> [...]
> 
>> +		tmc@1d029000 {
>> +			compatible = "arm,coresight-tmc", "arm,primecell";
>> +			reg = <0x0 0x1d029000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			power-domains = <&cluster_pd>;
> 
> Is there only being a single cluster_pd a mistake on kaanapali?
> 

 From psci map, KNP only has one cluster_pd shared among all CPUs.

Hi Jingyi,

Can you please help to comment this part?

Thanks,
Jie

> The CPUs have a different Aff1 value in the MPIDR register, so one
> would think there's 2 (also according to the cpu-map)
> 
> Konrad

