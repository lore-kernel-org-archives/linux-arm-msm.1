Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963714;
	b=ripa5yi9cZtea9nMz+F322bNqLWYLrMxSeOX8YBbTIaZlHACLi1nCl78W7c9qeNmVoow
	 E7Evi96UstcQ7Wl0b/LpaPgskJ0ShFs9zs+clBAA0dPT3Zj/BgjCdXcbL55XD4fBwMP34
	 F0yE6SN5PmwTAijowppAxCCfKTDqit9SqA+ziR4mZTlRcud9dhe5B5VZBj/LL2W9H6pao
	 9F6b69hV+zMoFVQ65ULwouMJRu5a3nxslh0ThOBI7F+lJq6Hs0V4vjmw2u7iRykriIAuQ
	 pke3q9L8clhGNbs8e28CJLRiHAHtQUhBXzzOTDKnypF2YvC+yllk/uf2dI83LJfzLsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
	b=4loyhk/PImnn9j+sUJMB+hMrqGOnsBXhCjf2qFDoF4mLDeh7PBORCctRuE6/4b4Lp9ZA
	 fFNowZb/Hqc8OdutvoklUzLkuJ3sOccsk5I5ngr8WVOIpC4p2ZmbVQ6mfGLbm3/4xnCCF
	 j3rSD+ehsRMb4EgJL1e9mE+YoxrDRJGnG9cch/CzGGulAOeOKYNqxShQ3fpVu/Ki9lgHS
	 1H40VEgwStx4nvMKNZgtzKvMx9qvi2gfUeAataNUGbSgLKxwq5i41ciRrLFQhh+EHSmBu
	 FDvGzN48WQb4ZTGTrYH1DO2orVNTDrzoegL0C+08mukx1lXpZBOkC/Y6NMFSNMnLYRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0YFG1cB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEDNrDHv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12879606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 11:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12879606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0YFG1cB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEDNrDHv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCeB2076172
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 11:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=; b=G0YFG1cB8BD0M8Eg
	KJam0otrK0ilvJFSoOBlFeo7fX9Q+rvSsp47ugNN2pn6pKgiGXoIhiKYCxINNrN0
	O3aUHcttAkRZiKlFKZoM8k+Jnjz4pRqDOYh9eRtN/sD65dh/RzEhmkavRONjp9ka
	aqF+yEdehdLbBSJTBmoJgxb+e36i8CtKSd4BMUWJ7TkNZbHJGOAR209GX8FxqG4r
	tMxP/kMhnFsWJQgdeHPZFmLPMrcsr41Jl1sm89oCE8almyAMCPnbZ/c3JLQ67F9A
	xtnikCQFFmxfq5lBf3tFeBFK2yO5y7Ldx8cxpXtj7SppWWGPC3032R8AZQhIlkZw
	T3LLRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcaggj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 11:15:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53389750985so949441cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963712; x=1794568512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
        b=CEDNrDHvgPLPyhz5kxDuIe+vbg7wZZ9wIyi1k1fehTdLVzeZyClATl2Zly/CwGZEB+
         5BxxXslItcTFCqgfd0gtFu8S1tz5TuP0Z+YPAiUgMSM9UZGv7b5cTwho6H2YKPiFGYM0
         6HwTQmYH5E1qs6COdJsBV3PPlGJVRwSfx9WIHeDr8JGww5QdmNRCucfGpTQvtDA6nR0P
         I1zkvPRhgEu+1NKXDpIyZOL/U3lCMYkezC1FIMnD+FGumIceYRYIIi6/aZAjiOMdASXU
         v/+QLZZi+p2hS+AqjbKzTyYtazBp2xkzv3HpSr5cCbhwVxSeqPU6xZqQW9oY40KW1o81
         B3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963712; x=1794568512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
        b=FJ58VSVs18OtmRGgPj3REXzCeyxCJeSGFfSaiPkm5AbwIg8iEBTkfzO8TEbkPl/OWq
         ReOMUHe1958biwac+eCqkfi93oXmsa6LCQz7VJskCUfTj9L4Vc126Bcu8z/IwAiFnx42
         jEVvRA65OyVQb+3TKsRaFRxnochiJ6XHP2ImAzVe0EbczgHjNhjMogCRfx66e6yrkuZs
         yYJ2MumdxaCafcgBR1bDEjkhHh/giThK4QEz2vuzoDsYE3Y04GZFDgNScQQ3qhaiPh+w
         5w8HTwFIW9QcxjzJ65oqW9T2q8Vyy0eTEcS3dFB+vhuvxLO72WIkQUV1Fi0E3k9sgZ0N
         n5hg==
X-Gm-Message-State: APuU4Z9Yhh13PqZ2ATeWULW83r9k8D8/yAIhPAuovyRh46We27WOp720
	84QS6b7TAGfUvP2uDYzS7nQwP/rXCEDggpyPbjbH7kitu96tnvICGmjQiS8RfKDJ7C+KZrKdu53
	niprDZC5ozpA1iym1Vvp8NAScPDflYDjD+bO8wRam/tgYATgad3QA1tgjJJcNLNesfCrq
X-Gm-Gg: AYBFou1GkPIWTq+7zJy6X/PET2d+hIq/cCC7yN9FmMsdcYVK2I9Y31wAD1zbovtsV2b
	+owPLYBJf2f3V+rZhy6Ut3YgfCGjva/D94PXnjjukO0QHqKLVkZVEKMfb3P7Q5wYlXHko1vCOUx
	SxSlm9f63MLSMk4n3NBcGxX3zj0Fk/NLBg0ID5vBt10zWrWv9TSSef+wtioEwX4RMODDvGXrimp
	Thv6hMXXnk0Zay4tD+O4qm1BGxJHYaR+dpsdiCo6ARhQB6MD6qbd3BRYRdVxiENJZfwv6wi+yjK
	1CiMWJW9dSgfnx+W8FNDN49kxg0qk0x3Cq2NofjkIEE2NaFvUB6mCSAKoG0KugqthuQxjT9WyRL
	rxchqA7nL8cyPRpy73Lvjoia1EslLeemQcDlX1H32hxwiCXSSnhqQ5rG8PXG/2TfdzAHwzA==
X-Received: by 2002:ac8:7249:0:b0:54c:db46:fb37 with SMTP id d75a77b69052e-54e102effb3mr35476301cf.2.1793963712245;
        Fri, 06 Nov 2026 03:15:12 -0800 (PST)
X-Received: by 2002:ac8:7249:0:b0:54c:db46:fb37 with SMTP id d75a77b69052e-54e102effb3mr35475771cf.2.1793963711544;
        Fri, 06 Nov 2026 03:15:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac7ddsm72549966b.8.2026.11.06.03.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:15:10 -0800 (PST)
Message-ID: <0749eb20-7cd7-4a55-ac45-fc2c616ff21d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 12:15:06 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8vpx74kpeUopCfAnm5VDlt4ZHmYVgOCU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXwk5u8jrf3Wzs
 3Jx921hGgTVgeQLO1OUBfz9AVwJzNlDyjjisHVnwmfGsFllfSMrER9ER4I6mrawqtqBAh/0ZZ84
 WDNnjueavWH5ITOwbCKeX7fZ85vHpity1/49kPkUSuwiW/QZ1ZciXo+y86zzgnzp8uewF5VMkny
 izJmKGTVPW92HaWYxpIJoXoIcJtoaMdBKPQkcDSu7Zb0UspEP+WBQ9Ib2aUmcQ76KILOaL2E0Pn
 xF9a+8CJ4+To3aGlAORHtT2FZCfOalPAq2q7sYwwLkUo69ZgxYUibrtY7S7DBksFBiK6K3u6n8v
 hZTPdPDnTKSFBkzc1Rva0inkdXN0LDYCAW/NAmH+EfE4S6QCETg7mIeK6cFb0suSEZKydY1hlIp
 x9430cuLzqsRC1CLfPPYv9deBVdvOyztlliXrQByBNaFVbUTdY4I69TVD4sBaP17QyNiBU/ULjM
 2YKTlaC34Fh19dEDoyQ==
X-Proofpoint-GUID: 8vpx74kpeUopCfAnm5VDlt4ZHmYVgOCU
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedb6c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pdLQg-RyuLVsQZ1OIswA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXwntcCG9oC7Fy
 aC40XouRUdTglcUZM/0j6mMNrnY8+fQUwjE5x2HL6v+Yoo/S79zampUJWY1SNPivocca+U7hZdV
 XA0hDp0dNmIlS5tr5pZFQjJqrmKyH0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

On 11/3/26 1:51 PM, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
