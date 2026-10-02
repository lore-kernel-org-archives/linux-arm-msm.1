Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D0D4078D2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932803; cv=none; b=n8kgF4FaNR5CXPVdTtcIDRc591aOJRi/I5c0VHasson0ROKR8KcidLE7PD8M2RWecdHBjrSel7RxdjJ6e9487gWfe7rOGWPYDzmGofXEhWNokXRezLVcaZe/TWPiHXsuyHbblak+zLfoV2RTFiU0/+219ER+FTCS/WUPOv+83zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932803; c=relaxed/simple;
	bh=SRiJOabsJOJ91REaT9PsxaaJ1Wgcz5xlOzFv109jR3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbUix0y5n3kcUkYXM4g8VWlU653VYmz+u+uGPtdFsmioUuUEW2jlg59NfVNe4Az/WpwhjaztMQst25aaaxVENnxu8Nim/pYZ3/MjwpLA9bBmIsWQG2UFC1AvZRRpRue286JeIwKlk+CBCq42u4d44emMNzSXzQjmapv800dZpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5olVGuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7zjUdVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5olVGuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7zjUdVA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925iu7F4019619
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 09:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xe19vggvY9hInc0pQhls1gOb
	n4wriMNRyAYJGjlvjN0=; b=M5olVGuG2dQeBMy2j1NTuNgSNsdCmVwV1IqP+kqf
	kSzUZQaSa2Go+JLHQaipv/TZ4pbhJ+BM1ZyCnLomT755GMSwp5k+yttRrBZD6MZU
	8bldqJ68qR7Sihw1d2589zSc0+YMHYlQLBjm6hpbOR2F7Diqi/UCVGJWpjHXLmHE
	f6Dn9w69OlJClWgWkp6eTq6hCNTnmXkVE59XlhzNaHxM5zJhjap19v9leE//IBUp
	9ByttGNPCMf7epR1Ef3Fr2szao/E0qjHmYkKRvsnNS+og1i7S3l9dk2+8QtV1jxr
	1O/rejwMI4k5h7ahQYXpqzyqK76RnvAmxhi487vJY5ffog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqbxyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:19:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso15534085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932792; x=1791537592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xe19vggvY9hInc0pQhls1gObn4wriMNRyAYJGjlvjN0=;
        b=N7zjUdVA+oc6R7S8h3HNcdjrCKGdxjZ2S79lHNm5FNcKX+zNdqj3j9hnz5GlzEZPO9
         rHLi5IMFVfi5jqZbp1pNZY7sTMM6i95cuWfj0MTN6/iFSgONVTq0Qad3koqS9Vdi2/H0
         LtomywpDp9tqEDx5B/rAAN2dK0c8wHmMRVqEBy8z1bhR8PxNrSmgVqqyJwypKonhB7z/
         WU4VGMWVp5NJ74nIFG87AAGrxiZVsqmR4kqc5wB3RBqBYOnX+D2CT+sLAqTgnbX6KGak
         r/Z1dokaFjcFp1SxDM8Ix2CydJZOBxSKRoGZSZPUJXeDTdiBnxAU2FmbWFmp35YfH9sU
         vYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932792; x=1791537592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe19vggvY9hInc0pQhls1gObn4wriMNRyAYJGjlvjN0=;
        b=mi8atRoee9UMXQ2+wymxDH1+r6owh4dzOSMNgvuXeZ/0mT1Tcrf98ubnQ7wIWZNTG9
         0VNiRFGNCG5jvgwUiAFbxphWcIfowRMq4AknfEgO7KvCDQRyl/jikhG2YL4k39rtEsw3
         QPfEVdr9F1TAnSQ+H7S2vybBP+QpzCdlfdh1lxssdJPmfkovlHMDOKQAfLvqUsVS2FXK
         8IG31YeaYKB0okl0rNqlwZfzO8GZ3GzpnWFYjtw1zM5OIrqE7nwtVpQri8yxlr7QbLJD
         E+SCUa6uay2w995GvANlmXaC3D+p3TMckudcXdJTiMpTgZSnN03lVovlVg0GP60vORkz
         rYFw==
X-Forwarded-Encrypted: i=1; AKwUvByfzUjqH+7yIsOwT1kqFJoUBSFg9nsua6rz7cEo8j7E2Pi3zkTtEwZd4upL5ueA2JtFTz/80Kbx0uBrXcO7@vger.kernel.org
X-Gm-Message-State: AFuF++nDufZCjUnbXSuutDW9rIV1qqwCYfa3RC5Cjzrc/TuEaKrTjPmp
	Aa2AWZQKhdAQKuQ5q5li73kqZdX1AlnvbrT9dw+1LLOuejwefNuBBHJ1pIvcYNXuQA41X9DCsQ1
	fCavsyYoOw2ZG+DeFDctozpay5edIOCUyMLntnDz1BvaCS9OkUBgL2kK6aUTyur1Gx2kn
X-Gm-Gg: AYBFou3K5dM4FeD32c1lKf50z73WkWlAfd7tw3vX9JvdHp/KbY+ljyhFsVIs+X6RAHT
	GzSdw+ivzBlPM8YjWK51YtAENRarjsMFY0JZqT5h4ZgowCiF+/j5l/Ue9CNiO69P4kbdNs/kGVB
	zF8jXGz/0M9QwMNA3Uv3CXspMMcH2W0uTD/FpcQugtaoYNsdq0/rpbxk8P/ageOzBVNd5vNddKm
	5LqXeR5LDtdi+n6zrMAQBvWIa3WS3+N4ioBbh8hEGcqbz7JkOviDtYgV4bumd1w3+0sjTFZlXBv
	vLozqOBAP+mwcR+1hTj4xtdIZltteYB8TUT+jdKc3c4nQlJV15GkIqZTWWOm+wudbqWpX9g2ACJ
	MTLBZQaW6w/ccP4Y=
X-Received: by 2002:a05:620a:8385:b0:93b:e9db:1bab with SMTP id af79cd13be357-93cf188feaamr325458685a.56.1790932791830;
        Fri, 02 Oct 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93b:e9db:1bab with SMTP id af79cd13be357-93cf188feaamr325455385a.56.1790932791234;
        Fri, 02 Oct 2026 02:19:51 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm71901235e9.6.2026.10.02.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:19:50 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:19:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
Message-ID: <ggoarbgjedwjsubpiap6fh2ks7yd35i2unfu2tlbqcitxru3qh@ue5pb435infb>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX9aBILcUP8Q8w
 /U180ZcmNzi1J+e4+35ePuTCgQ/JfI8ePQKz/D3FkanBcQVgF3n4KKjzzMNnfVT2IusHJqnwCsl
 LReEg8bCYBbHogf/VybfKhHEhooSqgwG2+m6maHZUF2wv3rasBQUb+21Q0yyutAjGd5lbY4Kr8U
 SHNdQS9HfGMLad0DF2cYnBLPsE/4BECQY4NzC7xV8SMbgoYs3LfCdjXD1ftWNaZa2tJLzxKUq+w
 xIRc+V6Me0fZO+dMiJRutcvaOr1XMoPvJdWDmaAzcbkqcsEQ7tYfcKPJdsV9B8xsfyvlZ4UAz+P
 U4tW3av2RE/qj0SFZ/qlB/KInpU71fz/TyOkTnO3Jh5xTZtrhEppZbC5/oIZC6QAG15CVSwAone
 v2WqRUR7wbIO9Ly0RM4mX2OdNN7uWWEV2agu2zSmqzRhUd8DqsZT1HMKGzv28w7Bz1KOzulimah
 rIRILSZ00OEtHLz9lFQ==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abf7739 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DhuRJU6gBchJA4Z4gf4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9NQ1N8CtTyTSrpQ9KsSqUEByysWLOX2I
X-Proofpoint-ORIG-GUID: 9NQ1N8CtTyTSrpQ9KsSqUEByysWLOX2I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXy2Zf2GMZENww
 WuD89DLYhf0TULAj7nUdKRwLmLiR6giw+udXGH8ITs7IVJqhxPMa4jXy4+NjZLUZlvN5xZO/fPF
 zkIkBAxVphMlFK7QNuEudF9UVMIrqU4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020037

On 26-09-23 11:27:56, Wangao Wang wrote:
> Add the iris video codec device node for the hawi SoC, describing the
> register space, interrupt, nine power domains (including the
> VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
> interconnect paths for CPU config and video memory bandwidth, IOMMU
> mappings, and the operating point table covering 150 MHz through 1000 MHz.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
