Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808109;
	b=UzucF7fTMtiJwr5xcPG0HI5v2yQawy+stvlpogjLqdYa94RbDkVDMkrFE1Bvop4JsfT7
	 jPwES0XHo3E8xw1mk3FgTfngZ7NxBmDP2GQs0+kAj3zRj1abSVr0c+upNssG60s1cqG0V
	 mlgTayi+Q6i0erJKVYL1qTcEyVidbZjTM/PFJI0sCNUGv9yxzVU+NDSvDMbZwy0uG6udc
	 w6EbGKdivJd+VH7DPG1AKCuZRgZDV7LWtEYxpjC+vTmqQvWrMagaUXWqRgkEkEWpOgXzT
	 +oB4F0P2Z1WyM0UWsKu1mf4iikoVNWEh2Pxg91/mUkNP0OXg/PYN8a2QvJRDpGz4qBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=;
	b=DZOJH6h6WNm7J6JFLPzWLeGlNDDRI7eYLMl6mtH7hUkTEs0mSxt13+8Np8iqhbXZbn5R
	 kz6w69MWmzABZ7YyXQnjxjsFw47WHoKV+fjXpP27wgv7RRBArG9/NEDzorcfyNR+Js7C9
	 PZuH6uux4CCaVSSysIc0EHdRrDZ+5wfeP872hhdU4Uzn2E9OtvfohEnVNFhFHCSXt8mCW
	 hexODAL/X/8YagWmhuP5GBgqYxuQmw8s4HRBhaCQdyryiuOnxksD034j6mfCjaVa4KCTA
	 a5we1jtRi+c+TuTreyEb51tMRbV2/TZKyvE4i2j/8a7vTCqJemYMcT90tbUfTk6/DhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mndZZ8q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CfZQ3+Ev;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B17606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B17606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mndZZ8q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CfZQ3+Ev
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjCFM664814
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=; b=mndZZ8q6HS31pdl6
	HNsFtLxpMXNTO5pmJCmr/NXsvnHKigi0f5KzgCkZn32BgqsFSWzgk9OlRyMzKXD+
	yMxEVMMJfqQV3l8LXfApIZcA4kk0NAC0knuKIvFL8ysMLpnKWHWGzITV+VMz3UkS
	mDQxV8LS+O04mkCJHjNVrxUK7KlfwnxikSLpOyPlptRWYyQ+RvEArDz8bbokYvuj
	VF+84mZEpqfDPNb9k3MWwF8WbWXRerzOPNog2Nnw1Gn3tmvpzWHbpMSLU+ncE2hW
	TvhkUhvT+5lqtSrml/7A7WzXwBJfVSEe2WV5B2enuHQTV1JzSp6oB37skhsqrtFg
	kqSbOg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0asbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:01:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36c9e87d262so1212856eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808106; x=1794412906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=;
        b=CfZQ3+Ev80cNv3HPJmUTNB3gtlG3Pt/oMko8wN72mYHQ93Yisn3zdksD4vxsk8ixWf
         6TkZEI/qh8saqWHSxv9b24prO/aeoYLMJslkvj5nlTfTntKvLkQPwgaIqJJbH9rQ4NlU
         HBw8Pa/CnRiUmM4pmYs7zg+iut/DCa+wqFJwnEn+BJRnpsWoVRjwBphidsr/yXVL3oot
         Mqr/rmMMtMmozcilMPkjHUqRzWe1bqd6CfJ+bpXWgfvrektT9hP/ra0G8QzC8LzjdH3l
         xZcGKQUcKR1s8NblXrHkEZPA9iNauCdDGaiwKIT3EfS8edfyQj2r0CzXT64kW473lmBg
         n6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808106; x=1794412906;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TVjAetQhr+zqiL1REQZJOBOF8yETe6loWTAjtaYDT0=;
        b=zgy2tcpkaNiBqet5xD3t7UQLSYE2tpGzZptfu2QWllMijLrvWmOWBpAbLx3ugTCBy0
         0gyczYFZDi2zZY+Srhlduu/VHCeexU2yO45Wd19pVTYYa83QKXiebItoVDqPABxvYE0y
         D84ofzzDqzBG+isfcyXPA4GQH+z9Rv0iXVhq/DrHzcDIKWvR/cUaQhs2/YfIBLux3SaI
         X5BZMO5mTaaN9IsXzonMAbXf7YSqgxol9KyehwbVCYeRwAWVgOuCDKl9Yd7am3aY2pPH
         D8gy/Rv9lHrXQjSQb6u0i1iyGbo1mXm5PQ2tPTXcol1CijuSn2bT/Yf2i1Vc4hPpbckS
         rOoA==
X-Forwarded-Encrypted: i=1; AKwUvBwNlGxSmvgotalfPKVpWYE1uGT0g3NiQLg3Y7NAqJpaEq7YHE4HFK6as31hVeQLUkp7cFOezBXlfsGT0knF@vger.kernel.org
X-Gm-Message-State: APuU4Z/GOuAn2ZCkynIDJdPv8WxC4VWrgRpwzcVXN17mHz3Q9TAL8b5V
	fhuKkOsh8fwoMWQGeytFSa86JCdtmmLwvbN230JpYCog1gL3KWXA96XYag1Tvj3gTs2PuZz9iK3
	gVOxoVWBTlw+q3ZZ2mPJ9YZIREdgjQN0An8IBvyvyxrsmebinJIpOOqtMPdO4G5nZlr2w
X-Gm-Gg: AYBFou3GkSBc5AujtLCcJdakpsei4mlJfMIJfTZFSRbXlkFhwjSz6fiqiCCpy24yUey
	5aghZEA/dhjv/DK4psHGjv9ZFMuNXlzn721/+ZLJgCQ3HLsKxRJSAoHpowI4d9ePNoqjCgNelJg
	kYMx4B0pyN8MuUL07CIT/SemCsH+5FFAGy5M2NM6WxNrV47GQp0CAtxoiqSCA3Is7bLujPJqTaw
	ON6HcnshgAeId4bWMGK/DMAguAvlN9yg9HZps/BZe2rdXLdWxK+wU+joY1geJj4re7ZEb8f4tKX
	EFFiSbcgNZuVcJEVEVTL3E//sOnGgsaJHIQ+o/KsdwLKlTqtIgKTWw7+WDUX3ohfn+mDp4lqGa3
	8g4pb2b7+BSDCEAZBlLy7pUJKxWAN4xmhYjeNnseiroLwBvaP7/+uwoYftR+pCLytquXRzpz3O9
	w=
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr25176934eec.34.1793808105946;
        Wed, 04 Nov 2026 08:01:45 -0800 (PST)
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr25176880eec.34.1793808105143;
        Wed, 04 Nov 2026 08:01:45 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm12698284eec.3.2026.11.04.08.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:01:44 -0800 (PST)
Message-ID: <8ae6dc76-1dca-454b-909a-ac5a09162131@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:31:37 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
 <20261104-smart-scorpion-of-bliss-2e8371@quoll>
Content-Language: en-US
In-Reply-To: <20261104-smart-scorpion-of-bliss-2e8371@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX94TBxjQHog3t
 at52PqC9p/wr+E0xK4HoPmZNwewmx++LX97nxPDHthv0uo3xrVeOjqmyCUhSdkTmskvrDL7vntU
 GfmFjGHi5mkfjpIConNe0tIzeNtn4Zg=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb56ea cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PAWBQAtbQnHvqMwJI70A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xAjqLdodU46K8yHtZ48VAnR_h3mRn-e2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX7tRZe9ydz0/G
 3qsVGBic0CvOOQzKjG9XCc9sZ1UAkzGid6K3K+NvqTgjZL+RxGFJR/B5ejcymy4n5n1sdy/Egn4
 PyfPRsARWuhmV9nBevaLrRk7DiZnpVjxY8geT04AtLKLvB2n04nG3cgayCtNKf8jkZtmKwvlsWX
 THeIdy+2HHr8LTiO9NQjVMp0WI6dPXKLEzNAJtISFA/uV82e0kMFi08zbuXjb7Wfrv1qicwtRji
 GKHRQSaBde4z2Ve5+NSFYt2c0CdI8Hd6KH3dOCh7zbsGvqGH6Z/QR1uq4e7+wLLgfXmtonZwG5+
 kLvmdA1Oo5BEH+kyzHzBJ9itGtaD1Uk44/uXiqYaSU806+aKBbQQb5oSg/atHD3Ypcf8EZoLGX7
 iMIDnkchjMju/rHrhe5Vtl+41TzQ957RE8e5y/JhvaWUheiJQzzX6a1AG0TL2CC557ujoEOITP1
 Tif/0+clUJqsuszXEnA==
X-Proofpoint-ORIG-GUID: xAjqLdodU46K8yHtZ48VAnR_h3mRn-e2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040063



On 04-11-2026 19:24, Krzysztof Kozlowski wrote:
>> Glymur uses the X1E80100 CAMSS resources, but its CSI2 PHYs are
>> described as standalone PHY nodes. Reusing the X1E80100 resources also
>> reuses csiphy_res[], where port@3 maps to CSIPHY id 4.
>>
>> Add Glymur resource data without reusing the X1E80100 CSIPHY resource
>> table, so the standalone PHY path uses the graph port number as the
>> CSIPHY id.
>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/camss/camss.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 1db66976e51b81edeb223cebb6bbe84995d102c2..4f705a056eedbc7b09d2630ee6284b8d768cc6d5 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5800,6 +5800,21 @@ static void camss_remove(struct platform_device *pdev)
>>  	camss_genpd_cleanup(camss);
>>  }
>>  
>> +static const struct camss_resources glymur_resources = {
>> +	.version = CAMSS_X1E80100,
>> +	.pd_name = "top",
>> +	.tpg_res = tpg_res_x1e80100,
>> +	.csid_res = csid_res_x1e80100,
>> +	.vfe_res = vfe_res_x1e80100,
>> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
>> +	.icc_res = icc_res_x1e80100,
>> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>> +	.csiphy_num = 5,
> 5? Your binding said three... Confusing.
> 

csiphy_num = 5 is needed to cover from port@0 to port@4; it is not
meant to describe three populated links.

>> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
>> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>> +};
>> +
>>  static const struct camss_resources msm8916_resources = {
>>  	.version = CAMSS_8x16,
>>  	.csiphy_res = csiphy_res_8x16,
>> @@ -6049,6 +6064,7 @@ static const struct camss_resources x1e80100_resources = {
>>  };
>>  
>>  static const struct of_device_id camss_dt_match[] = {
>> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>>  	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>>  	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>>  	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>> @@ -6068,7 +6084,6 @@ static const struct of_device_id camss_dt_match[] = {
>>  	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>  	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>>  	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
> Why do you keep breaking the order...
> 

I placed qcom,glymur-camss there to keep the match table alphabetically
ordered, following Bryan's earlier comment about Glymur/Hawi ordering:

https://lore.kernel.org/all/23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org/

I can move it before qcom,x1e80100-camss or keep at same place if that is preferred.

>>  	{ }
>>  };

-- 
Regards,
Nihal Kumar Gupta

