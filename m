Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA842E419
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421755; cv=none; b=N3sL9/GjMEqbob3MFXW87sT00tFwbjIvnNH9TMS9N2i2AV93jN07IA/vz5qArpMh5IKmx7SgItHhwJpp3lgTQwiXQI9ENSBNJduDqD7q8SO3bE7XzmQz/BNmOypXt5e9rPbL+7Z0C2Wq/z/zrhA44BnrolXhXeUDvh72Al/os28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421755; c=relaxed/simple;
	bh=AF8+smH/cjHnj6tf2C5BjdXBZT7dpf2B5g6nMZvyf9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+EOunfXkvEbyo78LJ85rN9RsSSZoGcN6BT30U7SRsgAy1L+MOW4awYe5kQ4G6M8eh/ngj9p19zFEeW30RjxoNRoHDAwbREYUG2pFuzAafzvZDguafWHbSPnAAGf6u3idTdczbebqheAx1VBZitev9Pmb+CxcYZfT06krnrZg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHk8LVq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EyyOpqDK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHk8LVq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EyyOpqDK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837LtuI4124123
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u87adjPXd/a9/pDAb++PYN7u
	/khN2/IMaGJs1A8fWPM=; b=OHk8LVq7Awz8FhAOG1z60y4iTf9ol7w4CkY9WX62
	Bt9le1Gr82F2RJETbjvOA5kBladvzUry58tClXUzNrAtFq9IZAfdd1RBnPna/xnQ
	B4BEMo2SLCql1apwzWgt7HBmI2ZpzsCyOpD0oCV8lb2FgBvE0ewEtI+DLH60jGzt
	eTpDhAAE3OLu8NsQpEA5kpwc+MGqcBExZW4Rd6aWBfwsMs+4NOYWuBt4ila+yL64
	B7a49qt40T+CvLOdKDjMro+2f9oq9iSiWC6tXkJjGjouPYBCQz6u+scdSan9uAVM
	WPR4e/U27l1yyzPQVFm66rYO+nqqwQNsixMau/+zB+aVzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg3f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:49:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so575089885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421752; x=1789026552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u87adjPXd/a9/pDAb++PYN7u/khN2/IMaGJs1A8fWPM=;
        b=EyyOpqDKMwkAMNA5wzPW+3ns7Fgbq+JvfIBz3zrLczjQpHQaWDq/8AE0XnCzEjiw7y
         Orpx58ErI6RRvU17UzPYB11NHSLdX6YOxs6IFw8acGTfqRmbx51UiLLW7ZGfQNrXfV0D
         q3xMuE78hE+5hBEyObpmsB48CyDCGHZ4ox3gVEl1O0PvG6mOrKUcfwV9fTFAtGI1A4Ml
         GiDeStiFmtHwrQCMaDB4mXq7jPXv6ajmb7jtNFfnKl4YrZtegHafnrzeHDDksXG7wuhb
         H5/U86Io5XYXWRii3ZK7HT8WH4TfeliD3U30+cwJmkmcSU40wmsiFk/ief5OtC65olNM
         XzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421752; x=1789026552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u87adjPXd/a9/pDAb++PYN7u/khN2/IMaGJs1A8fWPM=;
        b=TYHD6QvGvq3T7/Q9a3uQNB/rKbOO+V8HotWUG+zJ+fxpb4Qc3b10atLDxi3jPZi86V
         OuB3Wh/YHk8XmAsuO2xP1OvzBJPQQjutb/nFokVl44y2+6r2xPGIeJ+nWq3W7NF5Bywk
         PN4gU+JaklXH8izHQSbR6qJy+25mO8urhcLnd7OtT989kINONTv60V5tMQKWHOYY+dP1
         zzz7DoOA49QGf/VoPpOJyWHFCEzv96NNOAR7NUb6ukHewxupY3k3AUvYJxqfT11qxjOY
         wtTJqI4p8n/2My76TQ7NH4gyBmJGzkKwJrFb1+5H8T4CsFAMCYQcxsC0k+dNnKunqhz8
         nnCg==
X-Forwarded-Encrypted: i=1; AKwUvBzmjAwtYv/QWW0fxUMV0Oh61aEwzj7lW7nSHg1AQF4PiMKuVxmrrpi1tmVW497UxFcuG6rL2VqKhp373wob@vger.kernel.org
X-Gm-Message-State: AFuF++ndcxcSXJuBUUGZ8gefpvFqjzDv9sDo34oNfDCx7jvJaBr3C2Nk
	1JaVkFe4fp602pKmzHvZVcEsbH14T3xF0iZoynOwDtfzx+yjT4TIqKzeKWc37TzJayIe/0GQ2Ov
	23mjuwCWLnKiwUbDV3rkOlAaFBsfRVThXaeYe3dn+/4uuzhChEODh6++I+QOMQiyrqaGG
X-Gm-Gg: AYBFou1hqpcqMy5jaMZyGLIhvMDaRgao1Ej3kdX4lfnERgfthU4ZCEYd5adVU2z3SXn
	9vzZ5eNsZNjvyiSzVpqwPx6Xp/eRy7R7rVvEfmbJsJ0C7HMhhpXs1+bnZBU/h+wasx0CmLqQ8eK
	Mfx6HzuRfNA0hUQ9ujVQMABt/300ra1RbEaEie2miZbLR4K3i1rKtEbsws6hw3os4MXdrOmS3LJ
	9iJfN2LM1EZzL1zlwPV1ucVbtFNOc7CrrP6RQr4qZ48z2awiJ2ukr7wFaGUo16JvlFp91SOhImK
	gmvrdbh6U+PNF+esmAfgrM00TrVvD2JiRcc3kw0XjehZgDS7YViH2bjNEg/h3Pr2tj56kvS11lh
	f90Al3uXfHDtxqQ==
X-Received: by 2002:a05:620a:6911:b0:92e:51ee:7944 with SMTP id af79cd13be357-93960f86b8cmr793485785a.34.1788421752135;
        Thu, 03 Sep 2026 00:49:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6911:b0:92e:51ee:7944 with SMTP id af79cd13be357-93960f86b8cmr793483885a.34.1788421751664;
        Thu, 03 Sep 2026 00:49:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm81003595e9.3.2026.09.03.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Message-ID: <4gq3i4fldybx67ac6vg25kwddrc3f6uzp44pkdlnik32wg6c2j@j75ifdkrsd7j>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: T4IcRysSYLXUf_RwSTrhJSzYe_oBeG4I
X-Proofpoint-GUID: T4IcRysSYLXUf_RwSTrhJSzYe_oBeG4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX/LBV3dT7lUJ8
 +Blc0lumg33ft+yAF92lnU0+rSboN5zi7gSESscUQezl1YUcv6pZm4QscSIx0zPDMNMxoVPrK97
 ZQ7zvJj4LTsnUp8EWfb8WFiEMuZkDEZQj7ao6oSPstqskWMEH9rOJ6aQtmaeT2DKttZQi0ZNBjo
 sbGxZ0lMdD1hf+PIpuyEOFYfeeq0nhdYGg906KtI6ZbtJU1maJvdxJ/0eAWnELCQfgE4nqNqUm4
 HrMXZ/kte39HJMC2YE2Fn64S8Y+AOX/sUknOATdPhFr3tdoPWDwYO2cb3kDMsP3DvMG0dtAQ+hE
 84kER6wSAhIJvBFqXWLCyMI/TCTGtqwEdUKvuXFjM85VtaDyarvsRAoTOKsAwsfjRLM394JZ8QS
 N0XB6BVh/Q5aBymw4vSSX70cobauqdWuaTOAyJxddEG8vIY/qYxzgmqDtotHuuZNne/zv/yAFwR
 5TFlYfQM258VSryGhEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX39A0ZK0IEjXg
 R7GoEYKI9GDjPLBFgJYmxIgzjj0oHzJND5Xk6WO35ap6OAHhPu/2q/2F7nU3Lr8rZYD0oTxQnG/
 Y1cF9DcLHuh9O31G+1Ak7fyIfspELa0=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a992678 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-03 12:48:54, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
