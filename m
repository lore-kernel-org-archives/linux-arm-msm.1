Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED7545DB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088987; cv=pass; b=JZXQrBQtHHMqa2HhmIZmQzx/HvY4fxp2uJfSc2jRjl60F8XgfzEIOyIxwPrJ2J6kdge6galjhH3kwUmwkItBlqF3PsZnqBPPOnWOs9TyQpIJVDz5GTfxdOCQAFu0P2M6sFZrIM5cLTZNiICWq5faQommKjpo/8pkh2tWVSL5K4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088987; c=relaxed/simple;
	bh=Gvr9z8uZ9WkScolJzxXQvpxeADsyQ7B+SdrANzKCU/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktJC25Cxen89lZCYXLOqZjgBek25lqpjIbRirFvsHSbAotZAceDQgz/kvtMOo0MiqrOp925lQAu6o85LoL92gYRpoelUNriqOIRCXBrNcSFqcNH4XL8IGdhcRh7X2wQktQanTlHVnlNXReCzvdFY+ICgLYhhQuBWXMLagCtMwWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdTZP08g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQJ6Nalg; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdTZP08g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQJ6Nalg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEje6r898439
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=; b=BdTZP08g5+gwJ9VH
	KCFil2EltUtb4zHLkQAqIfqPWv2gfvy+bFvVn3Y2Ajhcz19MtLCLiDNrdVKCjg4Q
	bYRPyaTfaCa4lOvb04xT9Sez7eCZm4xDpq5m2iqnFkwryspSOHPu2pUmMHQQbVWg
	pDZPGBYeM/P0+X952PD7meN8oZiHpRV6BObK4ri+OKQLLR3bImB342iDNrbIf7pE
	qzo+gdO3Rx6y1zT6kj1SNCN9IWT6UPf3VEuWPVUgQJ5paZQcbahMmQQe6HuW+MtP
	G0eEdYGc3VBNsSvIIXDLnYApa6vCF52O0wvGUa908j92Cm10L+1xW/rQaJC1EwzG
	QTHjAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkaxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:56:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7566564a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088983; cv=none;
        d=google.com; s=arc-20260327;
        b=MP2dEWdDZv6bxFxylCjiZKGhibAU3rmRXXyNbzcUdsl8tKlLXnQh6WKXObi1E5scTO
         sWg2THPxQG2ps6f+YI0w0n5SXXO2mXH+UrAGFiydcUv9wdCsOTiWkYJpFOrCCdFUPqbf
         qEJ4ckI99Hu5N3NGP5E+7dz3sEEr1zofQk4DxBRU9L8qVDe83epcR7jqwfUpinbX1uLK
         jzkkrt2rd9Lt1XqY/l0C2yrX7eBEkqkAuRwMRmaZoBYg4PmWpyg58sGYGQXUF4zh3L76
         FLdtu4h5xBXpoLqxahzoYbdBcOqJZe5dXAiMxwHcsGFZCeP/bI05EaCgDcRkPLys3b8T
         PrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        fh=faEfB32TVL/6JT11JbR4sqDssobx2jku/u740bDXqNU=;
        b=DiJ2V/9pRMgcuM7vvHyMFU2BWHNy7XZG8dNlLaU7vIRyCE0Gr3eLnsMAGmE3WdjkoB
         Vl6SSj9E/Qfwss5Qoppdr4c/ZDKNWdW2Q6o+FXiScVjor1lrG2s0ev5oKdPOu9phVwLh
         P7skc6OBPV8Uv9M4c/HQK1bEooID1iBx0Yf627CWOI3fhPcevjo2m713KbFqBhB/6/m7
         wy3yCCIkGNHMoDR7gWY1Mm2lry8sTLvOxCXPKiokdsvJaU332CAU9csIHna7N1zhr7nz
         mdoO2OI/55pqA2hrOSXRAwZf3060YbDvoZGUptrqr5jIZM2XqV2PfXNL2fLAbyD7FJ5n
         TD/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790088983; x=1790693783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        b=OQJ6NalgjcSZY0MsahuorKX725+Gio+NG3kRuAmQj254pYZ8C5Dx/a5+H1H3YEtjIX
         7fB/1SpzGsJB2/hnfjj0K23BgtGSJmEs1ScsDEAfU8AQwrUmT3vwxGvkfN5ZPJF08SXK
         3ZC8bCZplQtGF8ScGEPThUVddWNoMnvyAjTvec6iCNrM/NbEEbSCRX8LAKdN9vL1Q1sw
         M11QccXXmb66NIcAjh1am1E+0CzYhzQiF0mG6Wf9Q/W+mjsLdexAG5PSJg7sk94oCjk7
         bXWPqdN/DRzyXh+7IsiKqiEUudTPOhTwsJkZj5G/WqbJ0fU2B5/BWinP9zdjVRm0lE1P
         EfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088983; x=1790693783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSlLroX3U4SuE5lDZNLVaDiokwBaG6UMjvRSNA46u/Y=;
        b=QDvDuRmCg7x0Q+ZV7bHvP8jX5rluJteHamNJxUa8sQf4S2QKYrrqb8JZh6x9ITT0jo
         5mGZ0RQTBBz0uKeq+I4vZzNjboOk/su+pJ3WTtNQDpFJzMSEhvSIK5kGBlO6urcuoEk0
         gAPFwB33efMQUdxE3XxJgXPjhkBBup+GPs8uCx+m1ueIcJYuPxrQSfJaPmOLMXorNI2k
         0xM1CoDRJT3KNWlfdLbULkqQNCofOcJJMJ4jB9t1Pa/0NGE0pwgP4MLwewaOhqPXLqeZ
         PEDTJ5m5y3WBgrS26HncftUItGzZoztz5oPGxm2GHySyP10qpw+vdTdP9G6rgMXpxzax
         t2fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk7KBILhi1xzF5SpD8L32SYAiL963bwEiEMVKZdnYxUcclJCmDMMVQ+EMfZn9GYsYRLxGCMo7oUhzP64eB@vger.kernel.org
X-Gm-Message-State: AFuF++k9RlGY5EX8eEE3Ehr1FgxAZuP5mrXjYrFjd1TSwFH3rKiQrVVQ
	q+MQypYZLGytqQfqJAQV5wv1gvOPMjKG3/ogSG+LO40V2qWFlHAesrx3gq2Ac/TMwGWEWONQ3EM
	55pSKfQU4vmR3dtvHpuDKSLFNeHj2gpIOof1VTVsQgrhr27KHKaaRghyLtHY5Cy7rNTcRwmVwfC
	i/YWvySlrN1dGn8p9kcQCFvjy5O67Yrj+tlsIveVNEAt4=
X-Gm-Gg: AYBFou09zxyX7LehKMQebLhKikLvW08WX2Adxz3Ewvbyuo9kCbPfgWkstb9KwJkiGGL
	SYGqdtzRz7pCa7oSp2AyG8MDctpFzNc01dZCnfLKF8FCKNpLrh1Go+wEa1iHfSKSjv87bCcMFw4
	39XAZi9scqjX4vny2I5phCqjuzlySNWjzKMFy9Mvff3oC4Z/uLxi64sRMASw==
X-Received: by 2002:a05:6a20:7fa3:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3ddec65dc53mr1956412637.21.1790088983221;
        Tue, 22 Sep 2026 07:56:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa3:b0:3d3:adad:f173 with SMTP id
 adf61e73a8af0-3ddec65dc53mr1956375637.21.1790088982664; Tue, 22 Sep 2026
 07:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922080416.484280-1-shengchao.guo@oss.qualcomm.com> <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
In-Reply-To: <f2fdd3f9-4412-40b9-a4a4-c777ff023663@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:56:11 +0800
X-Gm-Features: AcwNN1UKlLikVQy96fk9vqNUhC2Valt1AREowrLvxseRUePla1hTGuyeYqMVWxI
Message-ID: <CAFkd8huSqbHBirAshizAUNUGFQ9VU8k-1RMxjVrODMi-GE2vRw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add bwmon node for Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pushpendra Singh <pussin@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab29718 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=oTPx0ikOrH0KZUEDTLAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FcRCX_DNxb5VvrUvEdyqFZYjVp7rDbuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxNyBTYWx0ZWRfXyMOB6TQp/HYl
 z5++AGR6TIiSveG5ttuVhtKlojLVLSaapDuVSEVVzNhBe1ZhVM9qYIVAOYw+YVZWQ2bG98YQ9kQ
 MMeGwSDRrbbvp6bqU0BV1tuJvVv6I/HpCAEKTii5X7s0N124snvXLz1uwz8DXsmtHDMEx0M2zsM
 M5ipbhIG844VS6eeRWd3JawrgffTUyBgTA5nWTVh/QHF6lQMGjTx0I+EkfuLZ5ixS+TlPKe+q0a
 OMHGpmG0JkQKsVhMb/a3exFc11DnLJ23kxsxfImMJqxJfPITdSZNAU6HWM7aEFQ0Z5K38i24lrJ
 n1wVlXlwmG+OZQnZwkTmwL/suFgbp0d/ghPlbOBe9YcTJdX/556+7wjOxA5ZXxNQSwYEEez1i/S
 iIB8VKmUKrio9EcuxZtnxs3dKeDgj8YOntyjtMKbfiCxT5iILJkxJtFkIc+YRllxQbbfF55OU4r
 C42gGsB1HNmb1wGd2CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxNyBTYWx0ZWRfX8XQgCXCnbkO8
 pUWy9w1Wkluvn7xIIAXbNDW8QPM2HLdwdk6evg/n7ghPO2JnCPVvgb84tdnITDYWkw83ctGNex/
 CUOaggFyjdo3Sam9cJ1GEEBxJ1Q/fK4=
X-Proofpoint-GUID: FcRCX_DNxb5VvrUvEdyqFZYjVp7rDbuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220217

On Tue, Sep 22, 2026 at 6:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/22/26 10:04 AM, Shawn Guo wrote:
> > From: Pushpendra Singh <pussin@qti.qualcomm.com>
> >
> > Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
> > frequency scaling.
>
> [...]
>
> > +             bwmon_cluster2: pmu@1014400 {
> > +                     reg =3D <0x0 0x01014400 0x0 0x600>;
>
> len=3D0x500 for all the region is 0x600-long, but the docs say
> it starts  0x100 earlier (with registers actually starting
> at +0x400 like your node here) - unless you want to solve that
> discrepancy in the driver, but i'm not sure it's worth the
> hassle

Oh, good catch, len should be 0x500.

The address is intentionally shifted by 0x100 to remain compatible
with the existing driver.
The driver expects the PMU registers at this offset, so changing the
base address would require updating the driver and could break
compatibility.

>
> otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks
