Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B34848AE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841368; cv=none; b=Y9R/EX/Y8cAIcGTAQNPRBzbGm08pOE5fGnEQVpesJveOnT2aTFTaS6hSYtA3TCngQ7nzm5c87I97pBdd8P2P0zlg0rhVNwTB5r50uzL5eyACco0RAPivr6LZg3RbluAe1tvHw4LIvbB64rc8H5ip+NGvApuslwgIGPesS9fs3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841368; c=relaxed/simple;
	bh=jt2i06PWJwL+Zd9sRJ6XkgzJwqJKI5Up5F87w1qvJ4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uM//wc0tjJQDReq4EH8abeg1IC84EMxflFNOnjIxlAymCo09+AkmDJPJ5amirwLSsWce/X5g7yDD+GC/wMKbdeVmyxKlWhRgNn23aDN6kG4iapnw9axKeIsmzCUn1L/YvCASj30ClTr3xA27GuWib1bWuwXc6r+xjBCSEqTpfsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFcliw0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a85IC6Jj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFcliw0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a85IC6Jj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xdji2337306
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 07:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGUAnE4LAxdJYburvBSyFauCmovjGgE6tI7LIQQqL/U=; b=JFcliw0RaRQ61F0K
	w7WoNUOTStg3sb95mI495SNogaW6XoIYyt7wihQ1v3kIoQsxfTGlk/q/sayk+cqN
	KjkTJMP3rAQbo+/IritbIaqn1fxtUA5dUpFTswL5b2tYsTdGv6PA9fw8cpoH9ckt
	YXIYX9Y6FMhoo2SaHLcbzWy3hXZ7X9xtrh+OMMUQxLf+VTiOdbvos0pebzcTHtIR
	IfNQ8FQvwfcCYQPcoJ7JyV7cKnt/pXrHycVugC3hgpKHNeHwsJi3tZ9FmjLX0oJR
	rp2Ws7fggwQOznVyl4VM/luLUAEWQbvdD0quPI+nG/zDCAU3xJtyh5y7pHf+E7U/
	azRGLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n23mue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:56:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c6abcc2ffso43846985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 00:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790841365; x=1791446165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGUAnE4LAxdJYburvBSyFauCmovjGgE6tI7LIQQqL/U=;
        b=a85IC6JjFuoRUu+FDB2Z62qeXJHsscFBI1xyO6Wgoe1sm6JFQTAgicC6S2AMWHm6vV
         gPs3/q8y3f3FIdlxyKM9GAYR1wWxabgNr0Hg6Ok7H6ADHXq2fuL2cQleuPeEItlp21lo
         9893H5kC7nBCaPd/mlaMRR8o5SiK67EUA6iqdDtmL3ZZSdB3aHGynzpG+hDbGO+uPMtf
         C+84u89g/tDW+zBZTJVDE3QYZfEXlyLXNsJhoPCythBb8gv4uZ9F2xwRf4Dr6a/J9LPB
         qYN+jZmIB6jHjvQXrFO9XFkWu+IeeOrlxWYC02mQCdaKgObBVw7TLZ1AIG47nR5L76s4
         yyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841365; x=1791446165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGUAnE4LAxdJYburvBSyFauCmovjGgE6tI7LIQQqL/U=;
        b=YuHC7tAZ+i4qZhK4ACvG+ICbHoFEW4KeuSqkN/ewphzq18/PDO4mQUFq3tH63Vk8gE
         6NEW0Sg+b43k316eZ8J72SLif4JsrbH1iAiwEfWEq4pL6kuvswnhQ37Pt+dZhTCNjP+i
         sOTg6opFR396/EDmQOLXpo+B0CYglZ5Al15chYLYUMp5eFRH5KDEurt+fH7WBUgeFSqw
         7+SvMMlTzgT9/o8bK8s/MjRcZkki9LIqsNaryCemnveUoVTMe2RLY5Bn5jZ0Wg/o9Mrd
         olDcIyiSGb+4hsuualJaa3uBPjQgCEeeBd4l315zYENsKP4Ml2CiPHVjNTOMYNTYWqUX
         Cfwg==
X-Forwarded-Encrypted: i=1; AKwUvByhPtrFJU8ENOtdM2+XSPGEk98OhPxbm9NgOHmZRFeI5Dna2hGCPGwc0FmX4NTimi5JEn8SZF6j6apRJQPQ@vger.kernel.org
X-Gm-Message-State: AFuF++mac7Qhfz4MkwK9ibvBxGuYpWpLebh6hOSaZYZXHMzHNxSVhnh0
	nMrcdDlmv40nsiSjDmmeH1rfwoy3TR7wQ1eHW9nN9j1vuo5sm5erib0zgcn9KNLrUCijY3VcqX4
	JotMSOBq09EXr2/z654SaLtLcC4V/qNZ0pxxmqbJaOe9hhL5pS6YlOZdu+pJAEsuwnhcH
X-Gm-Gg: AYBFou2/8Y8IABhMDORo0utcK/zMOmYPG0XpJ/b+11WAJpIq9KDC8ESm3LUfZLrrQ56
	oaaXTjHiZ/LFk+j6NQtnOH/Nad/6bnoB6pXrOEgM/lK/u9wpCejGVt7hUPEEcfHwxcEtPCKjbI7
	fH/pyQvvoGWG6vWIhcTPEinU5XThWFkWs9yWqci3m8CzA8Vd0J3FcbTyuycmRjAZB0TXBWT1Ldp
	iCIOVrGgzgiAeW2/hZXzrTtOp4Yx+ZFoVPE/FtVxDdWHM7y+bNFZBvv5mEYHciSuGy+o773Xsqi
	MhuABvvASsfnDTAw4qYdz1eHjv6Ou+EfbwpejIwTpJHs0kppu+Q3bYVmNOwfyIXqh27SL5GUyld
	JXkGVLzmONysjsGxwRb1PsQ==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr666240685a.0.1790841364838;
        Thu, 01 Oct 2026 00:56:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr666237885a.0.1790841364372;
        Thu, 01 Oct 2026 00:56:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca74c84sm613066a12.29.2026.10.01.00.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 00:56:03 -0700 (PDT)
Message-ID: <45c87199-c98f-4f77-93fa-1c3ecc1e6eee@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 09:56:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: fix use-after-free of OPP in
 a6xx_pm_resume
To: Roman Demidov <roman.demidov.nn@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe1215 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YTtnF9t6jTAegt3XP7wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfX7xXVVFDRSXxn
 QjqqRSPg/J940a4wQbVoIoF8NSBgA87sGUJZWJ8+lUE/SEoX+KifNIot/PbnjN1r14n08LqWxuZ
 hXD3A1q7/+CG/IZWsdEsouDx9uGKVxk=
X-Proofpoint-GUID: fHdamg_1N0t4QLJh9tAnlcUPp_4ZVBu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfXxDlgIBH/1jwu
 FMhLSrkh9s1cyomFV9dCAqAJLmQt5me9kb222jmr4PVew/muk0GF7xs7+mcOwnwu17fp8eCPQrN
 7OOtlADq/4f497QBrgYQT2KvGuLo2BpwXDwrf2QSqvqTFbcdd60N522Mxs970Q98lgotfOvNi5G
 zAlzJ+iu8gQhXvcPRmcuT7hQ2LjFQdAHvACXPs/rL1Q9wiG8GeENSGhMxr+HFZMzc5vEZQ5UGlY
 rf4pPGw8pqLsoE+Qo7NxsbutVmHHsiMKkxPltEkthKWHDImtt11acDCt1e6hkxET2B1LJ3939wp
 HfFy1UwEE6XODon17QfB4agnymqaVmmXv/ONGeVZ+ipfrj3TrVXVwbmNFUx40Gfkyc/kmNinJvR
 k1/KTghe8yXBWLaaz7ltZLWJdk7wyXZffnOpY2kuIKaNqAvimq3TcN7VZ16m7P6+5AoLWU9IOPe
 6avrzthW36wdPQ7jIoA==
X-Proofpoint-ORIG-GUID: fHdamg_1N0t4QLJh9tAnlcUPp_4ZVBu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010031

On 9/29/26 4:20 PM, Roman Demidov wrote:
> The OPP reference obtained via dev_pm_opp_find_freq_ceil() is dropped
> with dev_pm_opp_put() before being passed to dev_pm_opp_set_opp(). If
> the reference count reaches zero, the OPP object may be freed, leading
> to a use-after-free when dev_pm_opp_set_opp() dereferences it.
> 
> Fix the order of calls: first use the OPP to set the required
> performance state, then release the reference.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
