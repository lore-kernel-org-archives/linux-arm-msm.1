Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796138;
	b=bEfxhcifz4cEV3LJmg+Z1+4ayhq8S1gWlmZdeV0djR0b1ycqvqs2jtCgFiuX5DDFdgdE
	 KlE9bnDAzcuFWSiphL903A+MGgrut7z+FKWpMgNx0i7TaebFIRrStzGpkdlbzypxtyzQ0
	 3qtnbTO4qNwwauTUOcfkxqP7U0ItPBr86It4FjD7HaxN3QZmegb2T9vM8Bmyv6qSiQNLA
	 AEKKRoqJTBjXtofN3NH9zQV1sTp++Szs7SHKKZG4q4ta7vkrzIHWrUmlqysXbYUWyuAcl
	 veC8xxTMAlelaPgSgNldE76PbOsjycGeHY1ABmuckwQF2lVkvFneeaUo/TJX8b4tunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
	b=esmW/vzdQxaeovpWssAoyu9Jty6ufarJSoboWdUEA1rTU31t3eZN9zMvpbGYRFOwWJWA
	 Ymz+sgApGb+OMUAyCtyiEjrcrE4arxerwatTI/RBsmaB9DSswTGbgvDZzfjwM9RLfdISw
	 0shVXxCPQvQI6hPeDOi5V/qDs/AT17kSRGI6slDklttR9Hsrs7nNhggs8XWJyK8jmA3Mp
	 A/aDV4NkKljfoY1kd8dWPqv1klZE8XF4DEyNtemaKfzf6st/6XFMq10W7vlLDwnjA069l
	 5PgE/ZumFQisVWa1wy7DMzHjkHaUXhTuS6Bhh2e1HJaxnwOVRlIWVvByCDomVhRSW5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28621606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28621606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bo1Wt1387641
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=; b=UiT1E2wlC4LPns21
	26JaTaMG0ZJ88knZvaPJ1cjuUkiOUawIQ7KxFarPy69PPOKkCaXNAQlE0u7DIQuS
	UpVXFrJDfRDK5nJBxe7V+mme0U2o+LPtytdGCG+LAH7QTc4zoYX1d7oo0I0D2bl5
	EHt5jm4z9yNyAhMQiXS2NJ3sqcM2etlzI7kbRdUkgS6rJdz6+JFds1f/FtcOCTP8
	He4yS2TmDqblmBUI8hJhQ4PZCWVZitBT8Rv4QTidQwZj39euTYfhwYMazKwhe02E
	DPFkeAGSu7BlGqeJsN5H7bJMI6W7TnILGDT/OteKDH3uGvxZYGgBPIDxEsccreDh
	u5MkAw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsga4bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:42:17 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7152379f5bbso326183eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796136; x=1794400936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=fG0FhS9JQn+BozO3evXFHnriArZEZZkC5l7152CZW2R27fK7q5pwkldr5KIXaccyxZ
         ktUvXU1x5GvctESAKnjb+WPO+l5rQEK8psMAsnDUFoAUZDIBA6tbK3Pw3nvW2ChPZO1G
         H5+SQU0EhZ9jZIcwwz+z5pHzfI9M4SzSilzDtoL+4hFPKLge5rwk/if9X8GUntqzkwVS
         Hq231NGU1Xr2+GoLRSa2ebBpFkWdIf3H77vasOjnxVfjytBdsXTYH/Art2wUuAnIKvh0
         o2ILH8JpqXx6bPS0EcOHq3/OkLJfox24t5oddyblrnzUW+ksp4cdL0lrUQeAjXqdEv68
         6o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796136; x=1794400936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=wjnh0uQppWMjqV9ww0t3w2WulbQAc2w0hpn3qN+5sOyLgTwB7TX1MJspfWNyCG3TuJ
         YqNlc4lYCgn7cWDHWdh7IFqnGc8TKOQDdUmRupdRaAkaNsWfQky+cZCWtrsISiFNDGcl
         EisvOOWBhtlDWo/jq9Han/Cy/i8R7XdKTeuCOWZXm86EfJicm6t8N+j67wZ9SH2w6RVs
         nfbXUPBq6LToxDHnYqyy8XYHOmiinNgHUijFD81aSJafYGlPR8vFFVyaCZ9F/20fmptz
         a16bhVpwmHzEKlO8C6hIPisrW3kFzKMpbVANyXkForOxHjOTT/uurRjO4mxiTjdR6dd0
         xk/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxD+Uf9I1Lpjm9zlmRtPNRn0PCHo4MgIVHTOHF9x5SF0KZJsycnHOWsc7APGdAywQjZiKVFCUesvKmeBY43@vger.kernel.org
X-Gm-Message-State: APuU4Z/70N3TAz7vzDFQ1D9WQpIMQ9HlAlDR7yqmyY79twHcMeVUf73S
	d6WZiXtTPEKxBkIwqVD1sm0F8lBTZgd8ArKF7SdtfBHrA7HZyJdZ3uEFT5W7+T8CEk4KnVk2V8j
	gT+HTtFIl1aRmT7dbYaCd5qJd7dQ3T+08Yu4hzI4H/QsK0enCSHAFLremIOqURmHEN2sd
X-Gm-Gg: AYBFou2zhXiFphB6GkpqFuOuXdsCQe5oFFWeCkweuSJiOqOtKIMM1LEWUJ8q9jKQq5U
	2kmRy4w89pL6KqMFLBHrJhjZVDPDpzqFAbLWpqIUK8pWoE42ieD5rOSIo0dyp9i473iYs7/rBYK
	wyqVJcr8qcRpvNyseEQKZfctxqhMU87LWkGrXh8aI89zrV47bjZNToEi4k9iKlhji78y0FWEZYr
	WMxz41HMSS7MuCzEn4Eas4cKBkL94jsYRmUhLCmTzfInCka4DppTtz3MhUrduoM5xseOPNhSYYO
	1PokzzqkAcn2SP9VgINXg1G6nm9LgwMZwVSCXpoC766IlQ1B7fGJ01EvTvBpZcm6QnVFolPDBjD
	oUtZTETaFKPchOs86+kv+pvM7sl3y5ONo2A42OIHQ8wnAVWztPc+7hD4CiiwvbWW6Y8bbIwMK93
	1Cx+KryA==
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458521eaf.63.1793796136316;
        Wed, 04 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458498eaf.63.1793796135837;
        Wed, 04 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1497063eaf.13.2026.11.04.04.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <f9ff9954-8e80-470f-aedf-6dd415b0e1e4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:12:07 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
 <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb2829 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Uwc5bU2mXagv8lUGyjYA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: buaWQjlYLG2cuk6vKw3cdlOIHJpr3JEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX8VXq2Pb05DgR
 4kC0w5vwx/ZVx+QhEitSaA1EWvb9Yn1rwfJnvUrZ1oof9UxAf+WLsenwaKkMr+RtMUXb+xGivwZ
 OxJNRJ21Nrpr27dZcNyd4fIJ1d45YiB4fNknX3dS2UphOUP4usJmvN+7axoGJKeUXZG/z3rGTBL
 h0ot93MRcmigc3qy6YJ6nNdMpHzFjy+OM4na3xy7S5tLR/NdkL8/M68wpW5QR2SjX/KO3tprfFF
 AjYwS0mTuYJbBVVP0Z+WV2EENAIA92MB/Q5uslP+EmfxmCM19136A+MgUUceC73/jdG1B5BCqWV
 laMA/U7mxYWjUHmRjR0MLU/OnDNLNWc0gyeBPa4ZDzY7LN+4/PJ67jrqL5sLeNI79O/wXsggyIM
 m3d6acPD9eZPanxFLd2Qq8jqrd3dBTZEqOr8lbelIZ5KGG1A7zfRFrUgBMYyLySVnOaLfh+WPrl
 24i7EBxnfxJucjYhKzg==
X-Proofpoint-GUID: buaWQjlYLG2cuk6vKw3cdlOIHJpr3JEl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXy3hUWA/hqH24
 CBhlKX00hc1FySqEouSq5gAwnUstLFohj80LUNM/T5qdU1LWMDLknE5KJP3f90fPhZlRnMr1iRY
 4NTk2oYx6/riXm1E5nNisEqXz1vNLS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:23 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> 
>>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> index 1e02578e4ee3..4809b3d8cfe2 100644
>> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,smb2370-bcl";
> 
> Like on Hamoa, why just one instance?

The BCL peripheral is enabled only on the first SMB2370.

Thanks,
Manaf

> 
> Konrad
> 
>> +			reg = <0x4700>;
>> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2370-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

