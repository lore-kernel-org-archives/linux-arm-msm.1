Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C855C32E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959800; cv=none; b=IvRyonIp4EB1aXlSpNWegyZ5qq1bP0HB2LEjJTgNyQNxhNIg5o0yPUC61PLrOlEdSxkUx1nAvwVL4P00Ts4zzxNd1kp2zPGt56LBAkIIz2iPMHuZ1QGmNITVUreEFelDwvDYwHYBR3DRm0enVS/EPndSh91NEnZ7kU5fQjfWAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959800; c=relaxed/simple;
	bh=iXyqVSWvmcW331rAsdNhFo+83AVBlrw5mw/55ZewwM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiYRkqadBtJIf+m17fIjNl3ROI63lj+728/tOm0dUgifV7GzPyBscu1+flWeIOtK+YGhiquuZOnpTvBjw0DdmNLJR+CZ51n5P2+VDhVySp20kJARyqFkRvRaMk2I7MjuxQgsZC/3nxqZsMNverFT+eCmdTOMffyqY667L2jVvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsFEBh9t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFy+m7Cq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsFEBh9t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFy+m7Cq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAS1L1233053
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 13:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=; b=JsFEBh9t1JX/nXmN
	5VuC1+yMKMrqmIlfarexpHaROym84F9Dsg7+UelBOay5JJFkHbgArMeHxhRvGiNF
	phK/vdWXHnPRHW5kZi0cAovhgqNi0zIktY160VDTLV1iz6zLI9027ewPhncNQ49i
	tVwiC+EufIqHQNx2oL+9eZdOyEpqcJtFz37kGUWpVAlpkasGWYWejMzMYIyZ4n2+
	0tPJIeCx+YRgbPYQDRr270x/qwC0VHfIIuulf3ewVKv2+UYRm2ntMxGCL+CPN5ff
	8Mf1cBTHFDTPlwiLWXYTv2vIs6Pz1CYlGYSeSOhV+G5zRxC3+4orlOMTDAOVl9c5
	FJ5Yww==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vg7tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:16:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65af4082aso137203e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959795; x=1789564595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=eFy+m7CqLoushf+UzAWzyUx/mFslIF+NqgDOgVDtC18cufZdVhBkrp4FKWw804O2yI
         t491s5kuLKc7r1gPRUhONSWuWYX4DkhsSAqNhTmVcRWV6lzewxgiB2GpAzowXGSvlltF
         Esc41SYzld6/TOzc1vnr6MLtvlcVpQ7WUdQhHA4udWuTzwXuglUy5KvYTPKLlkeoIDS+
         afiv39RsOY0i8+O1L1EWg8CfTFAlgIV+kszvdbbi7Xglj1qPCGitCGm9ICukNe2c9dq6
         k8K3gkuRrDFDS1vhswsHanzzTS/bfm94iRNl22/+dIpyVrsPJhh61aThdgKwJRihuoXL
         k/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959795; x=1789564595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9O/ZCwMRsoEO1n+0T3o5T+zX4t0ZK8Ed1UCC5oqjrI=;
        b=PVbsY7jqXnzBzLRJe0Q3BfzBNHPygNbnlO6Mp2yhWrTC/ECvgP1WI8HH6xUKUBZ1Vn
         toAiKFlgxlAb2Ful/PzTQu2PA9M9Icy3AL7BStCY2rafaP6+DmKlEbPtxcBNfzoS9TiL
         TmgqbEyu7a0ioImWUNaMN0SFvOLgiubos/8PaCFmArxdHO4Sdp1EWLR5rMy7dMSMXknr
         omIoy2xEnBD0HeaYq8cgTts5iHVQDl43cMdTi6yvKqF6oB1Q1qyFkGmVHbAuzyEwzwD3
         ROr7ELGtRIeaAlYAqiyBWuWfW49lb1tat3ZCsbyb265WgcoEJOMxNhyxPjKRTg0CSwvW
         SwzQ==
X-Gm-Message-State: AFuF++mhJcTzPZJjtzh9jmDnB/2u+1Fq4MWqA4UciElgaaJLGEHkO2Vb
	gT5aJy4X2jUrPwr8woTrDQ5w3drFC9w+vQ8pbL0D+bXnPxrZqvV5AX+uLkTsKuSKftrHm3IW6qk
	+UPAMdXwU8kmOx5OcRwpyICvRRHgSwkiGqQTxpqCqTAdshvUNQun4TVM23GEkRiq2pbcf
X-Gm-Gg: AYBFou2OlTpahzRju4GPaSDPS8rEV4bYkXAcHSojcRI3T5qavRGqgFDX/FqY0hhcr+b
	TnnlYY3zpyeaq8pCtI94EAQxIiP86GRJQrT16pNqAtAJe6KBZv11hxEa5mC3HSSCcOSDBgSCVBC
	Zu+LmQ4llnYdwcnitY2d7wGKzcJixoAFRveEZ0Aa+5kvcVblU6CTtbN7Z5hcO4qcb9bYTEe3aDf
	nkDEH7L/TGG//hfXANOF1/UEzwAXAhXHyacT5iVF1rt5Y+dEv6OMhqQWc1T8EyhuF6qE5SEqwVx
	8mv8Rk9NCLc8ZT9XY1jeRljyJ2waSPpqPbYJrWH9SPWhHrxfh6GIwR8VUEjjFCDMiKC257Rw6cx
	s5vKSKyiyGzLnNUXUbaK52w==
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812495e0c.2.1788959795496;
        Wed, 09 Sep 2026 06:16:35 -0700 (PDT)
X-Received: by 2002:a05:6122:8118:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c7fb9c4ce4mr4812434e0c.2.1788959794996;
        Wed, 09 Sep 2026 06:16:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74d55a4absm3280227e87.50.2026.09.09.06.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:16:33 -0700 (PDT)
Message-ID: <062d0fc6-dcae-4636-ae95-c8144317f0ff@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:16:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: David Heidelberg <david@ixit.cz>, Paul Sajna
 <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
 <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28fb606b-8631-483a-a02e-ecd16e9cc238@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa15c34 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=DKkjQw_Nfd4kA1BEE-cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: NB-ePFhB00DsDZQ5MVKZSqTatHlIYBnd
X-Proofpoint-GUID: NB-ePFhB00DsDZQ5MVKZSqTatHlIYBnd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfXyIkMabzvQhQD
 cti1BUJgbzFXPEZXHO1nRb3JjUSsEJ2n+SrIv3sZhMq5vFFP6LZ4oai1sBTR3hTJBbbLQkD0XXb
 B1elcTTVmNKwdi3aDJyMN6T342l2Wt8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX4z/u9WRxq0+O
 EglBt8FsehqQiWxA8aOwQZA5NA1h5NhBPbs3w70l8QKbXMwPlq1IwIb9fEg4pSdM6fSWFzSJwi+
 TBsznF4OQ5a0LciL314vDJXnBTb4StqrtbD22HOth3x6eQmmJPYJBqYQVD2bfzCVjLZn5SiOFPi
 olv0xU3i0kFrOHpvcrNgNQ+eTb4Xsi85FrQgHexDblScq8sY8bxoFbqeCDFZW1+9KPJk4IkE0jv
 aLtycQEJlYTeaIltLtnqA+0J8m7K/nS/9bGlop/R9ZgvRz9nGEyG6ejl0zQzXDwVzWFQsxm2j1w
 j9prULrYI5LgGj5iBTRfvr5Hgfgh9RX9SQQe1brv50PsDt0WA+MTYa1tmqxqsYRliw+DgIG3No1
 tp+x0SQ1bC/Epe3ACruc2P7Ii3v8oc01X8+/Jegi/qDxxKBg7k90jAymUDIHWsWFBsvTjI5H4tc
 1uTEhTWpttLrS0XHl1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

On 9/6/26 11:32 PM, David Heidelberg wrote:
> On 06/09/2026 23:11, Paul Sajna wrote:
>> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
>>
>> Downstream dtsi for reference:
>> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
>>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---

[...]

>> +    nfc_default: nfc-default-state {
>> +        pins = "gpio12", "gpio62", "gpio63", "gpio116";
> 
> here the verbosity may not be bad (device-tree functions as documentation too)
> gpio116 is associated with eSE NFC part (just guessing, but... it worked before, so), and generally the pn547 doesn't need it at all to work.
> 
> TBH not sure if there or what consensus is here about this. The eSE needs it, but we don't have the driver thus also no integration with NFC part.

The eSE driver would still be acting on the NFC node, right?

Konrad
