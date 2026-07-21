Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C833B52FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672558; cv=none; b=WdmJ9bUXEx/+UAOscy9Y3cxsuuz136IL2DjSEz7R0GI3RoAkdzVvF7eo6LFb9uk8Y5zpAfpsSUVktKAl+CvWPqd8sJtKhTyoCXGxEo4Nyoa0El8ozZfFReTrwSR7O6IBd2EYDDwi15c0GrIgOyA4QrL4Gw0wBww2aYCZn8dLhMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672558; c=relaxed/simple;
	bh=oiRL8ww/ia3RMiCBwX+3yfOmMp/5G69B0V9dS4xh4YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbT8VHI8BnSE8EylZSJaqn3gOmSa/J6KVfMu4YVjCjUIdwqZ4GuqVbs63lssbavfARoogOKq8w7D5pgcVeZtT3ahBrdrxNVI2exYsLVnkp/VjlOIemsGLp/6+9Z5AU/349ESBrur8y9Irifr6sCxcgKJhd8oLgyCA6eQ8hSsJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2c+mJr1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRS8dq9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2c+mJr1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRS8dq9c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlKQW2580212
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IOwS0qEixEL9+iD/ratrDcgs
	G8UUy9op58bwVac+vIU=; b=Q2c+mJr1tv+aqQ17Hz9VUNoV1n4WPNTfni0zKnBN
	+ZsAznNB9scgDe41zCDxNPafjjCY2sF/iWnVY0Nr1WbYETPBl1+dNomo2SnDKXht
	7Y03yAN9mZQsqutoojfoZUC2Y1Qf8Pkv54jUFO+JJtYn9FfZWZTNWi0tT4tzMz/n
	jpQ+tnLR+jn7Ux3me+rVYBL3wG92ZudSWuYTd2U+qOfIK43fBRyBz5VT6d9lPJOK
	zBllpNsV2oPPiXgkQL/MWMecz8UH01wCpH6y2nqzgwCe1hWfgFbzbrZl+roGoQrS
	ZyppHqGZqVOYKevT6TsG6BlLKop+eIfCnGhS85nmdIMwyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e13hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:22:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so116688481cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672556; x=1785277356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOwS0qEixEL9+iD/ratrDcgsG8UUy9op58bwVac+vIU=;
        b=DRS8dq9cwuKvshq5D0hDWemtCynHnq9Sjdixf4dAIjPtkyhhhb0XjqRPEOgPYyR9ra
         xCSiS/zYPxoKTxfI11/Mgi1HOSvbxRauTnoKDBcascZ0ztIpFgOoS28MWFqfOnmRKNUP
         4/ygPMTT/f8zt1SMqUFRYnv4ufHKNFgH3W4+mZNIqGC4LGpCWAxyDIbQfGke5t/SGJLo
         tZU+WiOimJ6zL4Re74749uf3+v8W4I5BlvboRwS2OBmzL9yaMEc5X6MRaoWBPB1lHAgw
         X93nToEvrCdLfKrowd0AB6w5hQmEFHjN5s1el9C5XAc1x5O4Zxk0Tm+WDVcTWihUphCT
         ox3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672556; x=1785277356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOwS0qEixEL9+iD/ratrDcgsG8UUy9op58bwVac+vIU=;
        b=Y0lWpCIzRvzUJ+k96oakgoGfZI6WpBnNJFVJYazZWYqUffIBOSmDKa/EzBuzav+vFU
         31igszpyDuPB6OxTKpuqTnzyj2g8DYZzjO9+wbQi9lwT7CyU5qV9ZNDBf1OUS3Ym6H0x
         E+SbLv1LZsKy6DB+LRyImxWU+Idxw//26spGZywY8QUAR3H7Hwv3dcL4+Ad9+guZvrRT
         gwPb9PxYh0PRef6m4JF0+nGZpXQUYHnBjvojGAMku8RP+9KbxtzWhwCrikRaR3hXjuN/
         ctk7h3v1XHcxzj/CRieEoY8zIbjxPk7JxzIPeoCicOlCVCg5xFUVi6cBBP69WYXfaeJu
         UKYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp36A4xs7mfb3Y1aibl7ciZddLkU3NuKAkhhcnfYm8H6Udr/j61ldjhDE4BR/xJAfFPP16lXZ4A81POEb5L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7f6VJiIwGMkUub8aK+d1bc+UZ2LgYA+xIndhHo1ofVkSN7Kqw
	5CN+xf/6aBwa6NAgvWyLj/++BxymOOE5Yc7JfV8xoNR5oN4NvCzotBdSc2jAresxuquciA0Fj6b
	UkDEzaMN+hvQpEDANMMI9TXw2J924d1hd1VIK7RZGr+pYnbHxAuAjKwbqjQ3n7X3YZTUG
X-Gm-Gg: AfdE7ckX/e0TA5M4TQhsE1hJOOR1Ne3QnSM2a4H2/kDitxGgjPDfsFGVvQqmigQ2DNh
	9jnfHjkJ+dS53wSxgvXwA80bMpuy5sPppC9v8IIKDCWd43N73OUiZtEI37EiMMBLYT2/Zby9hdh
	tZy50AqYvetIHmW+WIje8QLbqo+F6f8QaBQ6y3KDIs/dY/cM79quKGKWpM99BdGasGUq645Qnz9
	00upeAZSAA5akACZI+DSWaB7+qpuDetDS3SPax9kCyhpfjPBJdS62mrEt+aa9Pp55oX0Sck/NMj
	AfRgbZ8o6aZ0uzTYCHUgMMMuhJ67CCzwh5fEtx6qNOOlgxmvK3BH68zYF5MSyRRbMzCE/EkVD8G
	V2Bvwu3BgLQcs1bejL5ncDc5KbZqy2ysRCuCBwuEpHn7FkhmfxOXOiHQhXUrJNlFqEzZ7CobST9
	hzq5DeQOv1kpbv9A==
X-Received: by 2002:ac8:7f4f:0:b0:51b:f3a4:e6f0 with SMTP id d75a77b69052e-5213e48be86mr189118531cf.55.1784672555777;
        Tue, 21 Jul 2026 15:22:35 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:51b:f3a4:e6f0 with SMTP id d75a77b69052e-5213e48be86mr189118311cf.55.1784672555372;
        Tue, 21 Jul 2026 15:22:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8cd32sm150446e87.11.2026.07.21.15.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:22:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:22:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
Message-ID: <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
 <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
X-Proofpoint-GUID: 87YBbRHAK__556qDFWsa9ihwb15wqzdx
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5ff12c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=AEJebzvzT7BeqgCsZ-MA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 87YBbRHAK__556qDFWsa9ihwb15wqzdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMSBTYWx0ZWRfX8cdmWidxHnJ2
 LlE8yavzM5YiUZfynBmFZzDV8man2o0vCxElDOBE3UDQshkqq9uvpMNevKQND6emjielOcnP4BA
 QEy5HgOBeexwBo8KUCSBoNQQ4prccc5A32XUrcwqgrAYsyVYfDuFOUjleCWpG64YpobeKIT2qQA
 cCLRT6NBi4TaENT46bDDaj1bDF7SC70ngZdqQNwRW3aOdzW5fas3imRmlOdMbKk4r1TomOheRnO
 e3M/yOR4cz2JL0qpV/tDsrUGFIFNlrKhD/wxoy8v14MrvKG3eA/BVvCZwGESdlnkyrxbMcCKVDA
 broGWBlltRwBgCclJxlGVogVGfzf18/N0wmxaN+fn9tYvmZl3X0q27RaxxHz1VEJeCIncpWr5Bv
 zm06urgfmX+Qp5pKSB62MG9ViCNM1J0W17rF147UXLK7eTpPHaJ/bJNTbFesqoNrIc5tEXtFIx7
 Nn0e9Kmp9mRwSZur1bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMSBTYWx0ZWRfX1OrqYEWAhu41
 hl26/5qW5LqA8UZQnTs/0RqXwJ/CGq4t7z400fql6KMlkFgHrXxXv183c/0/8Ewgm96vBbGSb7p
 ETTxA3OdlZ2knYoseN9TEg7pSDTTEvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210231

On Wed, Jul 15, 2026 at 12:01:42PM +0200, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> > Do not mark MPM device as power domain since it leads to idle-states init
> > failure because of probe dependencies.
> > 
> > CPU cluster power domain node is kept disabled and hence CPU cluster will
> > never power collapse. Do not register MPM under it in this case.
> 
> This is only the case on the RB1. How about we fix the issue instead?

I guess it will be fixed by the MPM timer being programmed correctly.

-- 
With best wishes
Dmitry
