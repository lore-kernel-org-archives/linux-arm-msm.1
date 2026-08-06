Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773863F39E5
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009811; cv=none; b=aGLlnHqGi2PiRIuoVdGUEATCeDt8yBaiX+gX/wPxjK+ZXZnT8OYARAk94y8O+CCLx1UP2+H2HMCuVF6GLGD8wUnEX9FEy62nvtzWqqtmADTfcKqeWXikBDt5CMJ6GUARCJLNwcoMuEvh0Xz6WFut23uAiRRgMx95Bia9Zj+MEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009811; c=relaxed/simple;
	bh=FKKoLc015mjJVG+4o9DA2oVhBzwyFF9S0Xmm5W8hmE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7/T10pd7DRUFFNoENYjNEP7ZVR88g136lw3XTNwaxmvHj+Sj6JsS//EcR3sZHPzi2lQKu3dFmbKU7U+OM5u1v3OKTlWN27Usb9bTUpvfa0WnciCrTF+BR+AKzQhEN8wx9hBRm8CBW7SFOdYGeS1QAwo8QnnvNTsp6imOTEYif0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrYgEmEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQAoCMUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrYgEmEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQAoCMUT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ne8h1625694
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X4Hxyqxdpp76GzRnE44igdtn
	QTgZ3dQcpa3a9lgsChY=; b=GrYgEmEyvdyKNFsjJh6PVYP4+WlIugs7enLIoPJN
	hFzTgftlwQm+kiBLVgMJqTwIsUXKlDqkNS9YHSD83a0i2TOKMV5Rylg6XMPeOPSz
	oImCTXcYooGyBJOK76qqjDlwCdR1iRxeQlJ0EzoMYEMXDLeAAjGDYJcyxiwVu+Zn
	T2ayns5HzG9TJc3/j9Bd1EkCgYMcuF8oXGhgKVTRgTSH3+ERMUbinqHQxdsrZsc5
	2Q9GpxES6Pgn4IoiNsiCBjdqUlE6q/usFg7He+PWuR5r4BGyHHCgIgbhbgSsmkHX
	LlhH2t11Gu2s+V6lImUTl1zpd5vPjDXg3jpX9VcjMu7QPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntngkdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:50:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so35585021cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009809; x=1786614609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X4Hxyqxdpp76GzRnE44igdtnQTgZ3dQcpa3a9lgsChY=;
        b=IQAoCMUTGnUEzVp7NfxMwPxNFTJpb0HBYZEBN854K93L/J19AIPwmTWeoboYNEFR9Q
         ObUrEK2jemQCqExLe6FK64ptpOUPf75H0YXkKnlawbHAs8xcOgBoGlNYrAYqeGsMWd1G
         Tl1oFwZ/PwiNosCVW5HqTQjaTFnK4h9KGcjetMJS9fj2hGJmVelEPNZkihU3bWV5JKrc
         7AZqSz1RjzgctXsi/mjowW0sQBFnMoD9oLgbyhSmusq4awVv9rIjYuzUSSMj/w6h/g6l
         AjtLp7ByMzvEcD6uvYLNZDALqX4s0op0+S6iR9ffDPg4Ka3pyOiATFF5AulKm7MxY0SX
         VMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009809; x=1786614609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4Hxyqxdpp76GzRnE44igdtnQTgZ3dQcpa3a9lgsChY=;
        b=d4FYQ7t6C+pgRhGnSD0cCnSZQoDAhEhP6vEkR0taUxx+djMEezMleKSrRNUWfg3fBd
         pDa3Y45Hb1K4PkCMivYWWRbgNBO1fRRkmyDTDZR5SRZOPSsdgTtJyQdF+Yytp07ZtEMt
         eSkbzNah49pZzVARuaHNnoeHwDtOrZFGNXaM+MbIJL/HPkvgmJxkwMM2uc4mND8BH9xj
         einM0eBl6lRGMBUN1w5pI3anuo6WHnHmPFKXnj/ou19JTyq9HOFcjhtLsSSXJwcmYbZD
         P/ZA6uXy6EJZXJrJwfyM9ZHhkhn9g9Ak6OMDmv1aNJ3aM65spmcS50Z2Hmbv7ADmAuzw
         HatQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru8CAclcaX1ycWQcEsDEt8v5ht065RDq/j4RhijWonqZII1reQI2wGG+qdV9Oz/bGtTCuasVBlSQgSsE/p@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhsXkg+6u+9++xD4e0bBkgfa+prVUGFtlET9SDkSFEwtBjLOB
	zxStjuFDcWIMxZzvLwolGY1SV6Rq6hyZL9zjnCLoSM6oBpniHxrHmyNBKwDy60PW8lUvnEfTuRi
	91DHRnAChAm9vnsq8Hen91aae1dOhAwDsc8oJLfbdMUIMpOdHHTlbNtgXG0pgsyDacQhD3ytVxo
	EN
X-Gm-Gg: AR+sD11LZAAYt6sbDqhxVRn1HOP5hJVwRIaKwse8/0fOr2CufTMrIsZxYBPOKCEtdhA
	+WIo6chAeAfkq4x5F61gJiAVI0zcU5Uhk5yU2mt40fhk+ut9QXHIaUu25AyZC7wnQ2Rt4f8EMvC
	1lXhv1knL0XYSv5hsfZzQyf3Azn94pss0ngKaRmFoVEr949TKQChnur4bBFd4mtxiqE0B05Sf5k
	ZGKMO/6R2/yWFmRfJVMNoJBJybuO1oFvm/XjsHRjrozphJQ9cAt1IL9zEscxWOW2Q+PuGGPiHFm
	5zLKjE+N5aFTOZx1AP+kicKjrtHYH8XufZY+t8vF5HETDPqFVY/MdM3G7C6HbdlltzcR4RX1KIh
	HyQlQqa8YBuMern7AUuhgZAEOLDbJ8ivheNxU6rbCKKbB6SySPWqnQLlKs702ShvvG0vl8bLfh6
	gStWfQHLNNecgq0g==
X-Received: by 2002:a05:622a:5516:b0:51c:f8f:13e with SMTP id d75a77b69052e-52ce61eebe0mr154587281cf.40.1786009808724;
        Thu, 06 Aug 2026 02:50:08 -0700 (PDT)
X-Received: by 2002:a05:622a:5516:b0:51c:f8f:13e with SMTP id d75a77b69052e-52ce61eebe0mr154586951cf.40.1786009808354;
        Thu, 06 Aug 2026 02:50:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c3bd2sm597314e87.70.2026.08.06.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:50:07 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:50:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: cmd-db: export RPMh accelerator type
 string helper
Message-ID: <l2oyzsztfjmv3wdc4x4siq2ny7zrzwbus5d3l6od54ccdtksw3@4d43ms6c24fl>
References: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
 <20260717-rpmh-timeout-debug-v1-v2-1-81ade4fcdb49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-rpmh-timeout-debug-v1-v2-1-81ade4fcdb49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfXyKm0a3YXAQQX
 ktHlaPnuse8UuSxNub8I4KjvtYLTUVPPSbLoHBdisFtB+mpYsg56OrUQL/3T/sMBzGdEZv0q95a
 9P8cVIs+oGCeRpJoXNJqMOAcWhO+X+bL2KBfuLviTGlc7XxfNMt6JXAob59xw9HnElZAk0jVr6V
 of23ekueZwhpYX2NsnHeWYyHWbIHJ/UWonvrBd2JynnIfUMoBNIuPD1UPBProwv8bs5U6oACMTq
 xdmYOPsjJ3oBOS5P6xzJaMV7QZA5sQ+mf7Xx4c/yDb/ReXQLCaU9l45944M09NwjbMGumUB6eHm
 9cyMeoKEOuGiPdNPmWuq/y0NdcZlY2e+UvJpbhgpMYpJTHGOh0EJLJhAjsFOa2CNn3UHhnzcGGy
 qfToIC73iTRtKixmjGshy8ZxW7wrYS4EsH0zqkYOoW3F0jVJ9U0IXg94RifgJiYdQbMTf3L4qU/
 ONVgW4PP2Y4406J00cQ==
X-Proofpoint-ORIG-GUID: 3VFyaoXZGsdn7cEoihyzt7hSzsIk-W30
X-Proofpoint-GUID: 3VFyaoXZGsdn7cEoihyzt7hSzsIk-W30
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a7458d1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=S180665jWhtScyE4BKMA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX1p7E+zl09GHW
 McDXdT1oJHhqz1iA7fZ9JCXTa4PEKW7eUZynZAg/ug5OxCllorUfx243EC5bJLOAekLK7Qp1ZY2
 nWufChCTT67gRr0VvsO1/7s6N9w7dwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060076

On Fri, Jul 17, 2026 at 01:19:42PM +0530, Maulik Shah wrote:
> RPMh resource addresses encode the accelerator type (ARC, VRM, BCM)
> in bits [19:16], matching the cmd_db_hw_type enum values. Add
> cmd_db_hw_type_str() to map an RPMh address to its accelerator type
> name string using the existing SLAVE_ID() macro, and export it so
> drivers that handle raw RPMh addresses can produce human-readable
> diagnostic output without duplicating the address encoding knowledge.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/cmd-db.c | 20 ++++++++++++++++++++
>  include/soc/qcom/cmd-db.h |  5 +++++
>  2 files changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
