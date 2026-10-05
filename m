Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A1330D25
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183634; cv=none; b=ZZZOQ/g7+mDYoImC7QmTjWaYuV9qoNmF/LjztQHJnicS20HxHeUPrXgfwVOyzwpZEv/yqdXmgqiNNx3gWBuHJhDtTZ56DrONG8D5VwGwRRapyEypQn7L+GUaAnw6ByTtRqXcm8ft7PQh9XDcjoSQYjgTXEHieNm1Ah0mty3w0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183634; c=relaxed/simple;
	bh=EpdL7/5VREs7Us2Tm0M1lL6AfRDur6w+nbIBLGq+QZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh3TPkOAIUkW/m3wgU+9OCR7Hm2n9s4m6bqXGmVhh9tglW3mdlxDquDHbewtJAOXLBVcvcy85+OH4flybD5ru+iJjLxOetF9b/t06Q8ehFbPP8DejG/sP9UbaHkirZpCw5ruIC5ctUTBIPIpoiOrAhdhFnRVZfMGFfcMrBdkph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vy2t6ZrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsA5oF/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vy2t6ZrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsA5oF/q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104BF3688179
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KDLcPqpIgNJIp/nmhK/GLcgQ
	4LMkcMF8Ghan1SuoF7U=; b=Vy2t6ZrQX/aSosTomawArSqtB/4XfThI+kk+iDjJ
	S6dngWEzFHQJjI937xrje7ZyexNu0x3G6+DPXsGcdiMC72HvyfwxXSYplIVRU7bW
	brjfztDbh7vayy1SisNNRRQWyeRfUWMAasfBmXpHJeisaDmN2NJD/i2OxlKQorbG
	/ILb4DuAYuNedf5rKouEmiPKxb5Q5Iw7616EmLImAXj4lzUNngD5muP2KsqFawlI
	3otTiX34U0jl+tHUBsN0xSZUb23F4aU09MiorUnYooPUZVXxfcgWG6aquPUDMnTt
	QMg/R81WjK5KlHHijrW4+Jl//3UUIfnpmbuVpVKMJQudjQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjpw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:00:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso2188428c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183631; x=1791788431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDLcPqpIgNJIp/nmhK/GLcgQ4LMkcMF8Ghan1SuoF7U=;
        b=BsA5oF/qEILveZn4F8xyWLvTz77K/XkaQ5H7aE8okPCw7qyympiIO2OLHELuOx0fgc
         cHo3bzTwiL4jSeQF5ktRjvNiZrxyWuJoe3ILWyQS9+efpU+rmE+TM7feJ96skmC8nnrS
         QblvsADZOXvlAvia3dLlNxkfF2lMF3ccFGZhLKlBrEeXZwJhHbdQrHpnD3GJ4pAiaA8P
         VrgAIDDVKz622CIe4z5Y6/XN4kSOMkeQVPxEm2NR41xQrITqHiXpBUl+t9X9V2e5Conb
         g+j1mMKbjD6YhY1hcplXnR5iYP7lU1bJj6PzPBzyUFiRq7rE/4CN4Gw0BRJR5HgKk8ND
         37Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183631; x=1791788431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDLcPqpIgNJIp/nmhK/GLcgQ4LMkcMF8Ghan1SuoF7U=;
        b=nAnL8aJKcu2Cwt16e/GkyQK3l3m00Vm4w5jj80hYsoVbQ3rHUDiSXhGpfpUCUK6CFx
         L546iwgHeNmnJz8VB5gd0n5YDLYcTXylcDVrymqn62NYt+i2VwQYU2sgZtc/oujn9fkO
         f1CHjVfzcm5l4bECx+qSiz0o4BDvpq1MwguB0sAUrmNWdgyIEsIj0OW5dJyknR97qab2
         g6hIHxjhKb0O0sS2fab4IMlU6MF8w/UikkLQXlKTGxvpYXAsRDY9d1E4tJuscl2Hoagn
         85v6uiv0GqtrvP7gCleJNcbhK8X57+aK78AgS2PzapISBS9gF/98/0dA7akLSXHOgmCf
         Vzgw==
X-Forwarded-Encrypted: i=1; AKwUvBybXMd0N+ssWYWx8ZKw98f93PQn3nxndM4xhBo+GG3xCU7IG33irA4wUZ5purrC/6cKTlsDawGpRnR+ApIr@vger.kernel.org
X-Gm-Message-State: AFuF++nKJFnRe/E6Hzht8oDNYHYoQoWq8k/lwNhHN/X/LVv+oc2IvnHj
	pZ66XUtPjT/um3NhQ8I2T5mjlr3S7QC21jGZa+XMI7XzQ8/C9MuFwh/bf1rQ19C7vzLMGxEKlBA
	0abz9ijU/vDzMlUZ3QD1wiEIgVALpXDUL31Ceq9EKCiyE50RfCWSgzULS+T2zf8tp1DBY
X-Gm-Gg: AYBFou2ehJp1gkN7g6ldyrqEbwlsEllede4QxE7LNgDcIvZt4N3Hv+I6xK1hHDsOi/o
	/hwLnfWnyFTiuXXp368pllQVLCuyZMTelRFdfh1581uhIQC7BktepIije3+Az8VWBDiKjn1kfud
	Ef23Y7WXI7k1G4lxpBhS0vUq67uBsYzsg6pB2QNzi4qZ9eBC9CEZwN+iho5snAYJbIUBKsJNt/C
	je2XXiiaXi6coxawMxKRewKkqCgdHEZdmNPLJvraMu0/5dGe7n2A8RP7nRBdMTIptM2SmkWuu1D
	YfqOs9E4AL5XsIbW7JOnc5GHqBM8oHvpTIpXb/vbvLtx59smn4xICNwtnpOvY0asSf00+9FjMW7
	mdXxEblXW9gl2OMK7bMyDL0S44UA=
X-Received: by 2002:a05:701b:2917:b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-151c406ef8fmr7576484c88.40.1791183631341;
        Mon, 05 Oct 2026 00:00:31 -0700 (PDT)
X-Received: by 2002:a05:701b:2917:b0:14a:d8fe:33b3 with SMTP id a92af1059eb24-151c406ef8fmr7576289c88.40.1791183628384;
        Mon, 05 Oct 2026 00:00:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc3992b6sm21703268c88.6.2026.10.05.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:00:27 -0700 (PDT)
Date: Mon, 5 Oct 2026 12:30:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4
 bytes for read request
Message-ID: <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CyhBQ2Js3RhVRqCcThGYnP1he0JSZg01
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX3XH2C7eXsxh6
 t6tI7AMwDpxlPLUFeElTSe9C2K4EAgrK+KXS1L9gILh8e1ius21igdITnd8hSkTEAQn5kE3whG/
 jTvirVAfeWdN+BvbX3R22hNyALX2SCA=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac34b10 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mkkI6cI774ItaLwqv1oA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: CyhBQ2Js3RhVRqCcThGYnP1he0JSZg01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX5mOehtrDGb0X
 rS4WBokZwnWo+m4N1IeDwcxK70SN+i7ikNQvlewuVf/IlCVf09tv19hDXcGrVT37LFSiC2DnVAb
 5wpWJX2ppBboZFXENGydbbDa5fncSWeQQfXO2f1jUKre3ThAeQx4vuaDIECIysf6aDSLLZMAhsG
 rXrMKs76N67t/VmxoqgDBvLan/wicar9CxegeZ6GK0tJyuLdFa7oHN48OAd2txKZ8ZtWJBnLfnB
 Lm2o1D3raBSweMQEcNu5QxUxbeU2RoAxbsxvlj70CZ887mTpk+nQGSWa42cg7YESTN+SsqVpGXu
 7sajNSAeva/U1Yla/80mk3ISWcoZQw9ACWAcrqibv+3WRFQkSFmhpEMeSyVpvpUouNpgzd5C+kH
 abDpXrQ/Dk5TnZ4Lf2F1i488IlgbyD/tfxTvUyBa/8ku/86O/SYwDyjtTMHkzF9KYTx10Pv5yKo
 WIot40tY8vCJcQqIwaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050027

On Fri, Sep 11, 2026 at 02:38:13PM +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

I know LPC is going to start today, but I wanted to highlight this patch
specifically, as without it, both Hawi and Maili SoC do not boot up at all.

Can this be picked up as an independent patch for 7.4 as conveyed in the
cover letter?


-- 
-Mukesh Ojha
