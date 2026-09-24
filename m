Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEA47CC83
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252512; cv=none; b=TaWboFEZFdH8puIymLH0c73PZ0o8k151daHdYb+oBSioXejM5vMSOYgJqmESzE2745Edu1xha5YWY0F8eywr1O4+f9wQtnS9Zfs8HhbRMGEbggJrSvregFoFey6PTBBKfbVZJjHJlz33vkmsdPhGfFPLMXAbiCD8n5pPZZdrx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252512; c=relaxed/simple;
	bh=W539Vt8Z6SG2mVSL5MO66oLYOnLooDYITh5MIwCmO2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeXJGAJnyqQmyWrktBRzZYRaK4yBMiG2eIFz50+XWe+jd9r3Qsc/qyyIWQWeRsEfo/cFq1lHZegPQEoWK6dklZWRpVDYlqZ70n3Bq58JAOFWxAZUolk7fttBGTcvpC4MqDanI+b6H8eSd55IKSxE8FprLtW7xxeBTlYBxAUITYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtjemWms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtO2VCBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtjemWms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtO2VCBr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4tkD1630816
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uvknsm0QJ7SYg0XlXl2+u3TT
	lUve2gsckv66eEvFF/o=; b=XtjemWmsEJWlJ+BBthkyXBKppucex9FwGrYroIgv
	uZ8YiipvdjuL2W7hF9MM0lA7pQ9FXZDmfEULx5bapR3L07AJ0GVRyxAfz3dGt69n
	9irJysdGphuIOsmJvcUBJdYoQgMA7XA19uo3Prm1bh+iUqguMOlZbz8q6YeDLT04
	3mVEVi+vW58Kvcteq4aErABG/r953eOnGwgof2qxTtzehc5M/hx9AAZshGcQKJVw
	6nKEMb2nzbXVMR9ameZ/VpbWF1YTo3+kRgWUSMW8wHu6ynSR7nLqSB9vqmSCjhd/
	Gp1WBWswWIL7iPfKIGX2DEWVsIbAAp1V3J9IRLxJbMP/cQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90b0tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:21:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c846dd12ccso748179e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790252509; x=1790857309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uvknsm0QJ7SYg0XlXl2+u3TTlUve2gsckv66eEvFF/o=;
        b=GtO2VCBrUzslAelGNEQmMFlLY/bmrZbXGXPbz/dkjTo7UJy+0caEv4uCq3EpML0HQA
         kCDaOqAwNW5m5tQHALQ+uEjUkl7dbfYV96w8ludmmjBppFuTe0WC0gSsPVunGL9k5KP0
         B2zbGvzM5yYXg8Hp4Kntg59BKJD6pksCdIfjaMEC+ZWwiTpuqRB6+6V2vDL+Exj4df8W
         4dWLx3CJueKxeoyzI6rXHAvg+EFB0WipQ+YLEGwwfkYyJr+i0Px8c6NA9GpfuWbim6Bs
         Z98Tk1FUVAsQTDCqP5lOra5wmG6TB+Xyf3CxvCrruQteEdmd0UjE5cgI4Lfqj+2g5uOD
         S/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252509; x=1790857309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uvknsm0QJ7SYg0XlXl2+u3TTlUve2gsckv66eEvFF/o=;
        b=caFQsyXB2eNcxXTCS6TJJXNNwcKUIGfelVSlHgJgzkeHtMvVTCjiAOlsWTn259Gziy
         ZpSmm5S/w7kBLISu4W5gpm6grXRhpT3T4nFAZ7G/lCOcWAzGDijTMHRwtlnnuAPX6zzM
         J34nJC4YjjkdPBMjBdDmdaiUp3/d1yYrU/OzXdpxJOEZNWZCGS2a+kdwrlmpxNzJaYRV
         TCsuY1tRHGVm+PUGm707vdOn/X1tWUjBWvF8zGkf1jUKHzLDvq/vrxkQCKjN3rL1begc
         4K/1AaaeQ2TVNBKfbR4bqDLJ/UPzqEge8X91aU2C2v63KIw6tnfMSdxAb28k5JsxxTHi
         MeQw==
X-Forwarded-Encrypted: i=1; AKwUvBzAadMVrX5nxEGZvoQjUDBxXwmXzcgiOgdLZgv0YUUIL/dD8Re7qnOt8uhAd8ditrtzCN2GTETdxRSISwC3@vger.kernel.org
X-Gm-Message-State: AFuF++k76zKvg1hEjbLkGBWRONOS5QDoxr3ALbowbZm5MEwh3LVGpu1w
	8BeHPATOCq6p+V/PL00NxsZ5g+IuAr3+QZLIV+tGvHXoyYIFcsps7g8pXiqNWSBPjUVKJSjBWxb
	J+5mIwac3yP2TTP0KtXy0NGC5LNEjNTtzVEsuS32sicJWhtAogLFCTD03RWOPxqNSAoCr
X-Gm-Gg: AYBFou3jk4dqqqhw2q76n7W2Z55S5ZHLeTfLk1+uJ3oz53P10dN4d6tk/jWLP2vxC5W
	DQRTiCX7MB329avvpCUSEwahF1W1CbsJt/MxYwxZ+D76jOgHvDE4dpTDLFbgGmIn5eURt/le39z
	W7kuLhlvgjBkO+ppG1VgzFS7BJonIjQCwTBlMDxGLe+kNS1SeuZHtriNkL4cZPrHenmM10TLCuh
	htoh0/vAK8f6kJ+UJOzO9dtsGSaDvOJKLZWc7POYbmmNAjxsmUlUNg/ZNslsiJbG6w2BbAGWRn+
	6jEwazKDTmydNYoyPL+krIU38JYABO5QO9OtHUa3Xm7Iy9XMsP3LtGoG0ABkXlQDI7evwT4FGQz
	VzvRvW8dk+EVHJ0U=
X-Received: by 2002:a05:6102:548b:b0:7a7:1db6:c613 with SMTP id ada2fe7eead31-7af1d0b5b98mr1049106137.14.1790252509033;
        Thu, 24 Sep 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:6102:548b:b0:7a7:1db6:c613 with SMTP id ada2fe7eead31-7af1d0b5b98mr1049085137.14.1790252508382;
        Thu, 24 Sep 2026 05:21:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm62285775e9.13.2026.09.24.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:21:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Message-ID: <liusvxsimvsqrzor5jy2bflngcweotwvrnnczobtb7vqqj6cja@kugz7ucxyxm6>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord-gpi-dts-v3-2-74a85134699f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX7kM4pxYn8JH1
 n2ZpIODL1D8TfQnaXbgas0VW2QrzzBOR2ZU3yxAd8bloNs2n+PBeaEh9JCYKm1DRdrWjZ/wYHPJ
 CLCCQJpUzATocKtFT1WeJN5rbz9QLqE=
X-Proofpoint-GUID: NL27Rde8vfIPxUbMaJg43F89mXf3pdFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX9NiUVVKahUSV
 hEexjhTUvEzUfLUnRFc5gIEWFFtvUqUXAgVqSMCXKJxHce2EgmfuRSRrU1f/NpmWanQdJMcdtFG
 E3gKe9tghCNOrqLrCWwWe8YLkOO6GCRKAO8UX6+nzD080EccgpohtzYCtlNhjgCFv5GbJbQz7bn
 2tgZiIIEnJuaP7kGsJIrYwqwSFEmworHPL5KL2RXNbQ0UO+TshcT4cm1vOm6qCxAFeg4HE1CPL7
 1F/meUvVQYCcLZm3AFiFPhzeITWJkk5XaEmfEpVlFu2DOS59Yf/l1G5xIhOcSt5WkLRzypWQrJF
 FUJKtRncdBYZqyxiDQlsWVVzdHOh4N+eNYNddalYbyk/lVMjuRAh3tF4eyPHnplaY0IXjxuURB3
 wjVfW/QLenwMkkyhyDsCn5z9E3QMWXLmrwGmSD2JZPacJFude8nQz0iR2N993tOCA2H1YEnXnv6
 wCPN/swDTqqO8SF1jNg==
X-Proofpoint-ORIG-GUID: NL27Rde8vfIPxUbMaJg43F89mXf3pdFc
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab515de cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IF4djqKm59Tmvoe2PpgA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

On 26-09-24 14:10:04, Bartosz Golaszewski wrote:
> Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
