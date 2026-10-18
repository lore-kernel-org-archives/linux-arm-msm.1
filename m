Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C94229B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356622; cv=none; b=sJchHcQW5UPsuGzeRjprKcC/ISCrb47Ms0xrZvNZtiiAo4s9VXBnavzfuf3hZ3xRL+a0h6D9hIKRcAVYH1K8G+ULu7b0W+X2YrfVqi7HVgovrUPebGE+y1YjVUOKNjEkE1dnybvFFxXI22pndG8LotiJ4cd6v6lee3hVSOkRqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356622; c=relaxed/simple;
	bh=lggYG3UIDLXk68ELUMdJZsGAmWEaotCE/D1HZh4Dk6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm1Eysi5357RUGrOVO3W5qfH9yatP9nxuvE9+7nsAAsXXguf3p2h+oziV6viOqmsxEnVqRfqFW6JpHE02yFJBy+nWEKZb85zx1oFvb4z1zCat2CRXyx8uelAVbr7QS1Ai/3IxSh2wQSabG8K3Y3uravuYcNGGg5F1BLObe6yPTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alPDUBmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ4bMjEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alPDUBmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ4bMjEg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IKBrun1122051
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 20:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=; b=alPDUBmXZj67otSF
	nWir/HmgR0gxkaq9xp6Blsw7Nya0qwRi1CBwOiPBMf0eMHnvVwQDhl5fdH4Ag/UL
	LaA8KFy8Wj+qLHgKRVIP1Vaxj6VWDxhQbs/9tJnAiWfvyUhr368UuawqW8vnG7SS
	ODCoO1dfucNZky2JVCE+IGAt/BYrSW+aLK/ICn9DQhApMT18Nskfb3r3TgXgPuBo
	i4Mh/KCxROcs6gibcBeRmDPwcBiuc2DKpMOd0sHQ9sFwPi2U7Fuw6qzBziDRZlgC
	Ki6jYeOX2lv6KKFD+Le25U9cMmGYoDBfzyQMugtnw0hiLx3KyPh61BlFrHw6PvCv
	yYg+Bw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016m0rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 20:50:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso218749685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 13:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792356619; x=1792961419; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=;
        b=JJ4bMjEgG0i7qOqHcjV6d7CrgkwUo0qyq9jGvb5G7IG7Hyw5tLMBfwP3Pju08JaJTo
         /0C07N0ViLpobKwG5igQIsKZUaUH9sBXllgS51ePLrBCzUixIfmxM5J8oS6Lb8S+sh/I
         QHLSGiFbP8r0vsBuzjHtCFRqGa6MFJVmNGzwdehf8tpAoNdzlNA1ROxgONvHD5WJAM2v
         FS5knzdEjldEQyeTTqxhMoqjU8AWWhavFox9XxuomXO0/y5+G+VJHi2xlYP6TxpEmqLi
         ejkUIonMxvEgQ6brewVIa2bCOp1/xrBZiszgjQqjxqGgD+O477pOiaCSGvNdnOz9YLdz
         uVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356619; x=1792961419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=;
        b=UndAma2ogSlU9wxr4R3lR0XC3IBo125TCes2oJi7o8udsDfUHz1IZBTMLJqI7FoASo
         +l97MwnsUJ7R6jz8Lqc+9cdcn3fAg2EzjPLOxRggNlpGGcDa9+r8oETA/3nAE6aZgILs
         zkZRFG2+ZBWctNax/ulClXu8gtNImu0Sq26nb0b9AviBTCoxI6xjzdcIKqR8PzAz8om4
         xlRlvVvhbSVrdV4/9kCNHg6HBDqtQkj67wHsBKHXh6FIm15nTbFAf5Evg4ZZ+kmoov8y
         HZG/6HXOeFfnstQrPvbPUfBCFM27uZITjoeXGoDZQq/9CjyCSQRxwnRnlQ+UqM3ivETC
         mtDg==
X-Forwarded-Encrypted: i=1; AKwUvByDEpw5aQ+WTuYTJKkNP+dS/mRCkGpRl3nS3vtf6+RXEhZuiXc7GOP+K7ugSOas7cj1Z0g/7cgcCU5MUc84@vger.kernel.org
X-Gm-Message-State: AFq9FYJSdgFsm9SgZt0Nm+xzYVRDLoZx5xgevB9jJ8QgGHR5DR/FEbgB
	YXqURSRpcQQ3blzyGANWBP5WnDXBj387NP6uHjSr+XhZhBaeMuiDU7dXq2dxpL5SD5vFu+md3F+
	JREGyCA4K7p1fahzN9ZheUG3WYfn/yR65Gl7kQ5XOIbOhD5na3e8uoBmCh7XJausWIWx0
X-Gm-Gg: AYBFou0yPgWzpOWhBpSrsbSxqg7xH4Uyc3ElNTXQmIu1bLss/Fz8kw7wFgMk1lV6KG8
	v+K8Fr9QblMNZeZi85fhE+f5rIGSRCaTGubrAKPPAzsUhEeEb7Ncq8pg8sSdDSFXNJzq75cFjGD
	mzHT4G4V9kJGVg9Q0TuNaScQERVxoTLN519y+U0KjI3Dn6htHdeBYIPk3goaTcWQEl04MD/zrCi
	mCmxdzF2oe8THoSHzIW2EpRhL21FmYejnwAi5gR3CC+kVo5olWWVl+HL3FAubXY6umLFzWuzlcE
	MiwT8gf+VJwAijRT2jMWKOjAy77uVyvL9cW2eV1iUAvetp7Dw9+exEhYcMnrKrU2Q1W2I123iHG
	xp926VLV24zLf/e3yk3tlcelMmpCFlIQuQmIScQb3crMX4UptcEnM7NOrvr09jBbbf9JPHcXho1
	wcZ78KgyoW89D5
X-Received: by 2002:a05:620a:1a0b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-93f29dad8fbmr992434585a.66.1792356619159;
        Sun, 18 Oct 2026 13:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-93f29dad8fbmr992430785a.66.1792356618645;
        Sun, 18 Oct 2026 13:50:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63a2edsm1669525e87.68.2026.10.18.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:50:16 -0700 (PDT)
Date: Sun, 18 Oct 2026 23:50:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?Micha=C5=82?= Szczepaniak <m.szczepaniak.000@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <svmk5fixazvuzkkug3mvay72kah2kf73iptrrsc5tmjtqmpp6e@4663g2h5qumr>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA4MyBTYWx0ZWRfXxtf5QjX9loc+
 H+d35lMZHU5pfLHWPWygjXFrAVxyRFvunMxcNlhN4jeBxJ+a5Z9hW2eGbWG355X+xYrY3XAQpc5
 HJKcH/0sHarhaomKAD0LwhlKRTkhvRQ=
X-Proofpoint-GUID: hmrGE20e5-MqTeMylQhOW2uJTSC0By-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA4MyBTYWx0ZWRfX04rij6YYbD5D
 iSCdd7dWNTTFXxRf7c6OcpsEvztbCTbE8N0Nl7MKmJ78n4NtOkt2Omhoqlw4bMscNgAsD4xZGgx
 UmhsDS6JZwvp4zH/g8+GtDrWRQVLwnytHOe/EK95yAx5cUziPCaNVSeWTQAp2G8hmd4/kVt4lDN
 FU1QVmEUGCiRua7tfWnNOXCFxNJj6pvkaRmMyqVPGmefnGCGM3hPzhPJw2f4gr4bSqG4yrxsmqj
 nv29TFXHGCMn+IdTW/STATyZTItQ4TheR0FmUQmVnzQ8yzzDFJUcrnrrnVBb8Le91ozB2QSqp3X
 R/uh1sTw1J66sg6NpBfxSJiAM0ZXhLxITsK8TJ7biwZ+jg2IvzB3l3UERdcRGMJDqfMQgftZXCT
 zxoSClrXRry/JlIg6BemmaUX7gNFtclToSKtCGUJ/goO6O0eMdlH3rnDIbgROrGixfD4HMNKcdE
 qp6IFKRbpPTKBT3G44g==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad5310b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KAcPb9uwQpV6Y9LkPCcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hmrGE20e5-MqTeMylQhOW2uJTSC0By-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180083

On Thu, Oct 15, 2026 at 09:59:44PM +0200, Michał Szczepaniak wrote:
> On 09/08/2026 22:15, Dmitry Baryshkov wrote:
> 
> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> 
> Hi Dmitry,
> 
> sorry to barge in but I just wanted to let you know that I 
> gave this series a try on the Motorola Moto X 2014 (victara,
> MSM8974PRO-AC, PM8941 + PM8841) on top of v7.3-rc7 with the
> msm8974-mainline patches and "clk: qcom: mmcc-msm8974: add
> GENPD_FLAG_NO_STAY_ON".
> 
> Display (command mode panel) works through the MDP IOMMU. The GPU
> works too: the Sailfish OS compositor renders on freedreno (Mesa
> 25.1.8) through the GPU IOMMU, and I don't see the reboot reported
> on FP2. I tried 3D acceleration, and it works without issues.
> 
> Hope that helps!

Could you please reply to the driver patches with the Tested-by tags?

-- 
With best wishes
Dmitry
