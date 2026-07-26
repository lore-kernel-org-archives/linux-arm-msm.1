Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C912F1FD7
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 02:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785033659; cv=none; b=D2xVak08Cd26WZ/BDVGzdm3yJLNU+3dWyz9b+kanZJfF2EGKCvotGoQCx+Ohy7T93nJZvs8NrnozD8SSyKAu5MEqCo40dEcXZV6GGzEj1kuYL2raLcSo31ddg0FeJvBH+ILUnKW9RsUurawLE5NEtpxfjGmd7fUolKlCzhiiC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785033659; c=relaxed/simple;
	bh=bGinmj9HAQbqbkT1zowrN8spDu+gNaURRFhkOFq316M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZdAwapGNQXA0CR3IvuQzpnRRGLkR0wGNx/OgTW0FkE0GSAEfafsjJxhrYZVv2pHTeAHRjE5nqryc541s89E2mzIXc2pG2kU6Yfx6Ob1lCztRdtXXjmg103c4pXweoyvI7cyVWmhmdy5d4H3SudhA8E27FjHMBKc6FabSnIO8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlwFWeZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KutNGwCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlwFWeZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KutNGwCY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66PMudos2701469
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 02:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bGinmj9HAQbqbkT1zowrN8sp
	Du+gNaURRFhkOFq316M=; b=FlwFWeZyqVbWsgQ0MDWwMvTsQWwX1ci4DWJvRyjW
	vJOGxzRp2fIBsl0v4XUZGH0OTQ7TtoBMWkc7voEOZzjGnvwWbxWP1+PRFtlBB+fI
	EVNmVLn9xLQPbgz4eYLeV/iKaOUd0WtOz442JpAlRhjm8dH5gWDLc+aNFrU8uftk
	xGFKcAn2GORJoJMLYhcGKPgNRI30kYS6uM2aTHdDWcbOHsrGHjHNB65tSKIOVZwY
	bUCQtnwVdRTqvPg/wY/lpn2ZotVcxjawUb9pmFdMOXt7ZPRTWErKJSOLdrM1eiL+
	CQnSWVzEdzqCxRg/NYRHTJdNg9YsQjm8FbZZhVPz7T6Rqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajhx5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 02:40:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1847003a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 19:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785033656; x=1785638456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGinmj9HAQbqbkT1zowrN8spDu+gNaURRFhkOFq316M=;
        b=KutNGwCYTaA1TShXrelZ0S3wC3FUWpojjGWfbOrL/98FTBgDBngRFoUVrFuEr61gOZ
         mImerm+8TRmhAblVE746ocEqRAddR3/EwaoiVLGCPQJ/FdFo0Bceu9NpKr6wPOsot78h
         L6Tgul0lpDYg26WdV9itWlKsdIKjTiPl5jFRqnn2D5kkYNDQ2as8exlxgvhl5kxo5iyf
         LrrOBI/IN0z/2qfNT3B2dysNhazyswdmauy4IC0ewYHUpe4jH2rspdrMzQLAp5gQ4wz6
         tv13t6E47tZ2z6gV1p/4EaDQ92x82kwvQXpGRz1jKiEbafKEYzU/Y5xsLtCIwKCfQLyO
         4DOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785033656; x=1785638456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGinmj9HAQbqbkT1zowrN8spDu+gNaURRFhkOFq316M=;
        b=Zrqthn+dTDJf6uAKKPe3fgsJ26jNoMMqzPkJFn79i9MhpESgIuJshtWwUHEU1Nkvrg
         KoXC/FhXRfqCJTtQGfMGu1B6WXdhv44LULxQH73IvLFOQsjACic2HW2jCEulV2DqcoW0
         SboWMT46e9eJRgjyZ/HWtx72u9vE3RS1ONbeJ27xWMjNjVJiSeZ5LSNKEsZI1P0pr2NT
         RB8j/Vs404H3olb3ZVk+eHYBWANjrPo/jqc4Ak6+WJMkvutkA2QG4SKrw4JryLiTMNj8
         RFyncwfgAkCr1ecUc43FY28mBmIYZXciWADw2TZ8AdZZSQLToaKu80gPhWoSpmTEszsU
         /QrA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Sb5xbsplvnRsZ+YNlhWE/4dErfyjcJccwMALbOEUY5ETPi8InGqdHPZxk/ER0/2OPUSLevlUuEeBUyM1@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZN8KmY4kD6pFSn1ELSIagzo7cs0zeusPs/6cOhBfEoa+aT9c
	bVd6yvefDNDocOhx98CqYY+ESvWfUCPeL8XVKq3dy0zWYp61VZkZkrQRidAL19S7eIj1lP0Ov6K
	NKqQ01MBQtmKykU1ah0PivPLpT+2MqJj5NkElsZUISjxzVF+Sxa45BJQXtYMhBiCje2pY
X-Gm-Gg: AR+sD13DIGlggOhjfeDpe8PyUWWjT5FfjuqmwbEV579P53yErNwnCQuE9ZhZMLOQ3m1
	JB/cuFxSrgFND1b1wh/81rJrQw3X5UBiSNwZXfoqKxs3hjDUaUbpY36emN7DuQ3SIsOP0eX5dUl
	molvV3PsVxFe+BAdisoXtCbetLAbiiSRhC7YggWj/gkI5inL+aAn9CEgcIl2ZWmcqvtDm910hZS
	RSbB1++1rp34Zm/X4TR/lEpInkYv2c2Y9ufBZuSgFqLiFc8GYKIFKU6jLlrntU8bjRDPwJGqipS
	aS76eexBDTPzxMV1HQmFx0+V7FIEpB4eifVyj8JONch2E1CW0yK5scJKKxDG/cluhY6bXukDxnA
	+0JLisYLlJQ/c0xTZoGhlnpVVM1r9mQtVHWAOX3l89QA=
X-Received: by 2002:a17:90b:1dcf:b0:38e:4482:ab14 with SMTP id 98e67ed59e1d1-38f29605bf2mr3868347a91.32.1785033656325;
        Sat, 25 Jul 2026 19:40:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcf:b0:38e:4482:ab14 with SMTP id 98e67ed59e1d1-38f29605bf2mr3868326a91.32.1785033655891;
        Sat, 25 Jul 2026 19:40:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm15374676eec.26.2026.07.25.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:40:55 -0700 (PDT)
Date: Sun, 26 Jul 2026 10:40:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        alim.akhtar@samsung.com, avri.altman@sandisk.com,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "scsi: ufs: core: Remove unnecessary block I/O
 quiesce for clock scaling"
Message-ID: <amVzsmnZxze5PZIT@QCOM-aGQu4IUr3Y>
References: <20260723124733.341789-1-manivannan.sadhasivam@oss.qualcomm.com>
 <a1d56354-a556-4e47-875e-e6a079fd4938@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1d56354-a556-4e47-875e-e6a079fd4938@acm.org>
X-Proofpoint-ORIG-GUID: tiGD02YerbO-HiByXzOueXA88CeuDtWt
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a6573b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s4jt7IWuD85VgkVn8k8A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tiGD02YerbO-HiByXzOueXA88CeuDtWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDAyMiBTYWx0ZWRfXwQpkOwFZAWUO
 pTIC4A7guABeuNN5wP7Ra6ADWsIaXDeMB5dOHL+vhj7sT1qI9PL1qMUIVCoEquvI6jkawrLVexM
 yJoJmiP1L741CDV8xrXrtTVfYluVyXlVsOorIZ0IESopEiSrn/aOglvtg8j3qDRngucf/JE1nTL
 akghbt7T1+7s2wcH7QVB6oR+lyUy0xR7IEYd/oHQ2IpYABEkD3eUcHUmr1H0EYZhjKCkOCUy0ag
 HpjvW63HvFRkNAxOTw53oKl91TLrDvsKRktuTDEPIwau3pDgoeHce7FrtmdGHv3Mb0nKwMqzG/G
 kdyJWGT5fisYyJAQVcJS/yMBg7LJ1W8Vo7FaaKRF/gILIcIUiY2/DIgN/STeMlBpEumsTnbhzKU
 x0vdPsVE+FnUmBxDerFUPTCUnVEA+zq8g0x7izvYDfUlmgOyGAJtz6FJlkvPbEUVVRhFeHOSgZo
 rZ/gLOpvEU5ZtdZ9HZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDAyMiBTYWx0ZWRfX1il7+cgo+0Kw
 FyVwAPdOJsgK+6D74uUmNwhHQJOuWRazEafrquKsu1hZ9vrmCW1rPnvTZ4qKF62JwWhXp9CLhSe
 VEoJDCePo6NBoHXlgMrZ7hb9zA7Ntlk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_07,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260022

On Fri, Jul 24, 2026 at 07:19:34AM -0700, Bart Van Assche wrote:
> On 7/23/26 5:47 AM, Manivannan Sadhasivam wrote:
> > Reported-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Closes: https://lore.kernel.org/linux-scsi/al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Has it been considered to add a Fixes: tag to guarantee that this patch
> gets backported to stable kernels?

I'm not sure I follow. The offending commit hasn't even landed on
mainline.

Shawn
