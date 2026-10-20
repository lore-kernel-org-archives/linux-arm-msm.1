Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530913;
	b=j9SAW5yPQsm+4BJMDneUAB/lV+ysSzBDo/dv2gbpFSU7ccf9FIgMak4rq1XRIDS8yU2Q
	 5ZpZw8tu8DfyYE3RYy9Be+w8791dX4hmX/pvQYZiy2Hq7m5EcGMNwVTUmnenTme75DVQN
	 0WuHx/a1Dh+iDQgW8gtunznOFm2LXinrgKw49aoHr/g0rH0PBkg5dfv5OhsfOuAWh4P/S
	 bW8ePYCZrWVpFFAGxwmhJYEuAQfP2O2Qp+/CfHhE370Iyv09wxilA/ZRS5sYBTzEN8o98
	 URccbe4CiWSKQJwS6/sQTZYh9WX5gFOWfZ31O4JDQUA3BaEqWxXi60rsBiaGUvw1z5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
	b=zf2YYEN+Tpy42FBBhYMc8dGXMaj4ksb0hyzPAxNyCZfX6wPHfplS6R9PL8oIRapPnqND
	 fx3hv9INCCYG2vagCQIGqVjGrB+t6BXpEK5nJnkqnP88kC3+uII5fqOQQASN5IhRkvT0T
	 bQx1rhNtQ1t2vXkVxRTAi5Bwq9mQfnB6eYlmT7ub/Fxm0XqVjC506Y/SBNRPSs4G6/VC8
	 p8TZ4U/jZxX6IbaiAN1thCxS6uSXkHRx/ojQrvTK/clL2VzI83DeZUti3bvIVIfleEb+X
	 OIkfesAztIYuL1c36Y9aPWhdffvr7yoh78vQxdqqd5gAi1UBmmN8isUPThnv8cjgyFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD6606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C9NNQjG1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXsHDjSB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtuul3229741
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=; b=C9NNQjG1dc1jZvhz
	INZ5MeHYvQob7NbXk8rKACFzfVBqvffe3AeZqpaROPWbb1yfW8X42Eoclirq1ggX
	Iv6lahrbPf75YvtY/E+SHxCiGDixLnCRCphhgFyb/867QySF5Jq0o0odIg5FsFbr
	+gIx3aspInNHqeVDdXOKw+8zLjlusYIBeW2z9QCQetCW16+t30L23QL1ApdmfpCa
	Qb5ByE4iyExp5bA062UeZSfrBPY23z7mqxpmUwSdsR5gXaifJ5cZ4a+9cY6BveLI
	GhfhEoTHiMjjau0iJCk1e+dK5mwO82b9J8h/PnN7iDLzdeTljpqUM6cX2C4Hcvhq
	2x9wiQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nvejh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 21:15:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35d4538fd74so12086eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530910; x=1793135710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=HXsHDjSBN+yDgmGuJrFT/6SYFGrwGDh7Ec+qdvvDvQyS3hID9zJ3maPPULaEgYM9Nx
         eVku8PPfbpIAb415+rUFj7aW9eC8aErrkgcTxLgUpgAylPQ/h65Ct3psJgsJbfVKJBpa
         URBp5k/zAyLaXg508punWFlitzaO9bX+DOxTe2xAvO0wTw9N3fX6ZHZfVQETNxjAU3zY
         zEYvzXudsFNPbXKOVRDZArhwBBS8Cl+PX2oqHkV6Lb8j5+c3t0V7681GG4rqzrJY1G05
         qS+DH2k0Y/kfVtYF2CtVS0wO92eXGitgnIP75MGnT0gV6h7aImEv4v8LOIXiZhElgyUG
         4WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530910; x=1793135710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sT7TNT3LgoGrkuy1rFoxBJWa/Cwt6lKP6DMVa4zjFec=;
        b=I5wTgks4aP+zIAQ7sbr/Gya6GR/l2Pb6aBkqPefzsvUoRAfUkjczR6I/2Xl4oznPsn
         tpWy2Pu/wTCVqfSip705N8uB7oPmS9hNO27W7CxE8eaSSqTadSTKARqIN8g74yJLLXxq
         jlgRURozi20jjRCV0H9MZsz7QEZ1Jm7hP7+w/NvKZREykkSs+4q/30Lf/EZh4rEFh5G3
         r6VaX5SXBbXKNFUePpmKTjEARAMNlEOhVMejn7o1ZAd7o1xrO9DwenZa0iYc+I5qcafw
         U5C+bfrP0AFVjIJZw0uw9AIWEw7W02bdyXQ1VW1gmSo8/j7e2AGwv0q9+L8JQxh8StN8
         gyyw==
X-Forwarded-Encrypted: i=1; AKwUvByCUnA6p2z8I38CfyfdFoA0Zqa5fbuKytOPZykAC1svf4cSe5ob0hpS1wvgwMSsEWkPK4WvMrP+AiM5lxWI@vger.kernel.org
X-Gm-Message-State: AFq9FYLU67WDvYxEu2/xSJ8f7+Mwks/0QtcIAZtoKS+aptaTQyyY/XaR
	nUZXcszG32JNpCWzH46ZjqWxgIuky5JhrQIEsocMuXq+P9LcWsW8+/6xOxhZGOpGezvQmxtbWGO
	CPYRsh9MomiQ+cgfvOPXrBbp5WukX9CEgZj8CIoVli8ilEsVYLdnPzpZN2oSJ3559lm+7
X-Gm-Gg: AYBFou08dJCvKPbkHwKHHjtulRnTYm4nK+qS9qcnQ0VF8RjwiCvdijiBRZ3tJPuPTeI
	ItBCUlKgKCqZ+EFm1RyO597a9RdDEIgHR1MB20jp2o67ten+zX5r8rq49yCeCe0uvbb/iuixq52
	77FlZB1IxmiPBeqNTVsDOtWxefQGKos2aeE2vHututucbKjs1yr/0PuAQRb6uJj2vqAPMfwOBod
	2zmmwqH2yUe5/yYWsrkpVCkYL9n87Bi7udjjGzY0Qx1GtS5yM4g7jHsgeMvLCHxRuNU2E2s8uAk
	+QA9XHzBnCs70oOhXUUAaGJYfWs/eFFowVZVjgfmHaZt5CwiX8a8V5qjcbdZ0rF94dOe7OUU91G
	LVoVY1kaLeSGmj1ZyyEus9EWYDRBjHlvgsfVZzUY0h2cM3jrdH9Tj9D4eiQ==
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67546c88.15.1792530910040;
        Tue, 20 Oct 2026 14:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr67516c88.15.1792530909271;
        Tue, 20 Oct 2026 14:15:09 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d68f2b1sm980129c88.20.2026.10.20.14.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:15:08 -0700 (PDT)
Message-ID: <7b5392f8-de43-4d31-8f33-5a6d8e0af6a3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:15:07 -0700
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
Subject: Re: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
 <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfXw865zsqV7YHG
 16emWvTIf6SbMZYM6sikp6YzXio8KzRxagTJOMgLemT/kaQbEvW8nv8Fny5vhr3/+vl5DckqypW
 WbgUlF3HJHcy5rBt73ZHaTznlYehfh8=
X-Proofpoint-GUID: rU_uzNtrvzeF9IBfftC19kHGsfZA7F1Q
X-Proofpoint-ORIG-GUID: rU_uzNtrvzeF9IBfftC19kHGsfZA7F1Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX/hP9iQDdkja2
 lGaNPCClnvVDAHnNQmDO9T1Y2+C0X74O5XNOmQ0inE2z30p2dWOAixz44H8IkzptxE6ApamPK2i
 fkd21B0z24L738B6LyrmSVkW2379EMxex182YFKzjktUUHUOD07q8sb75ltSEPBxQhDCP7A7/vK
 ZBnwHcvufKdOU73ntzuaLEZDA5vh1fIYL50kklKWWZLQXUE//J5mh9Qkqresayni2bEbhz97/FE
 tbPWFlzeREFklJE0o5BOyUhU3OAhXlr138KEoqZE5wND/Yo1QseqmOL42rjCnR4oeA8JeV5E15y
 m3Twpp4zrXvhZoSH2pOVhFryN4rL+rd4kfYQalyRq8bRIGcvSz8sGWd5I9z9JjAkPk4YH1yahPJ
 VqJZzcXdVPLohG6ft/Dc+BscQmc3fJJ7FhRTtXz/dx79PqBiO8g/9lofBpzdg94Yf7bcJmJldv4
 jaJq1pba75NpyeIhPFw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7d9df cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=18DxlMPwXbuUbd9su7wA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200084

Hi Krzysztof,

Since qcs8300 uses the same register settings as sa8775p, I will squash
4/7 and 5/7 patches in the next version drop.

Thank you,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:55:00PM -0700, Anusha Arun Nandi wrote:
>> Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
>> sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
>> and SA8775P share the same CSIPHY: in the legacy in-tree
>> CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
>> cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
>> and common_regs_offset (0x800), and camss.c gives both SoCs the same
>> pd_name = "top" Titan Top GDSC. No new register data or power-domain
>> wiring is therefore needed; only the compatible string is added.
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index 821c6a0a916c..cef4a90ca539 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>> +	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
> 
> So devices are fully compatible? Then express it and drop this.
> 
> Best regards,
> Krzysztof

