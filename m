Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC344AB99
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849750; cv=none; b=TSV2AxMW3t2zCuhBFBb/ZCYgZPRbi/1Wq7zw34rb4Rj5TYmhL6ITBtigbHlPIAkGWO1tn1SgRa0p5B7ZbeZe+/DHRiAmQNkfk/Pu4QD1iKSfpqxb4IqBJyDKGBrhBF63OdkvJOzVTYDjdkHswnrcMDABD10cuuW7cyFu82Hmz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849750; c=relaxed/simple;
	bh=b8cAENdW5UBfeKXGM00Njn9NJat57NtDZ3mXZlH95q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLV0mpkWCiMDKbvHuZUJ82LwWDqIVF7nn3YmhGicVgTw0QrPB8VOt8tiMpfQxgnpDVd5HyvrhvSAaVLR1187giWx/ct/D4zdlCKYQohbT3BRpnUKN5z0Kdd2rUKV8iYW7z8Zy8+aVTYcZxcDrgytkL9+aWP9IXcLmvpMnxSdZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pB8dDdrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGRPTpkz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pB8dDdrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGRPTpkz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CY0vw3896538
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 13:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6cKta+lz1loaE7DVGHn/1G5j
	fGz45qD/ucV6NNVBOng=; b=pB8dDdrlDMcXRAk6hesoh9rlsGWYY34gISGdrdbf
	XbdhVLwKRBzU88GCzfJBw0cD+Vn2rKAy3kIhIkb3FZMgYZHX105XXIhNETvL0SuZ
	E/NQchlt/I/itf/5IQU8igTQ/1fJxK+6h3Y4oE6NKUPXJ9GAQILYWbbUhYsXy89I
	8IS+Nr8qGROBQWenmemWjOZnahGHpCtzWg47vmjRoCH5THqPJv2siQQy6rwRp6Do
	yCAeirE9IYXQxX0kvbDOf2YTa0JiI4wWdpy7iJIcFkICRJvHHuyKdkUC8BXGEE/y
	dlWU7i2tGiRcDfBFwuO0WOc73t74PJVJewAapYnVVaPIVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8bs7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:22:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so48497211cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785849744; x=1786454544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6cKta+lz1loaE7DVGHn/1G5jfGz45qD/ucV6NNVBOng=;
        b=cGRPTpkzJskeybKCadKWCwt55YWtxe4tJKuCDBAL7StKWrB0VGGc2Axy8fy4gyeraJ
         euVd7ISKFANRdNICune3Br4jkLL02yFa9WUYQMpyvXqRSpg/mA5urFHQSxvkpguUiNfx
         YjU/gx2VRRYVO/jEtCfeILt4Fe45bhKaq1hf6C+71ENBsiaJPYY6k6Le3d2MBkq2M54T
         vGeAP/jiJYIAzZMi2YypzTOhI1Y9OWaYoKalR4teu9o5zWQ3Jh3X+pWJKU9bA1lJXZ1i
         xO7wVmwW5AME3hgGy9w6qO6Dkp5NJu9kqY0f96zakcDMNfoOEfcg0lOk3gfuSHgMp41h
         ppCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849744; x=1786454544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cKta+lz1loaE7DVGHn/1G5jfGz45qD/ucV6NNVBOng=;
        b=mD7a1r7YzcUly0AhObWCt2cHpn20Oubzz5St19tD6kBsTMuwrCFky+lP+1P4keRk36
         hhRRaewQRfZ0guK3Zct/lJaBnH9MT/+aPVP/Wo2aBbyMjZUWmShCjRzIqWqoBmG/V2dq
         QMoveauL/w2L29GmASQTSCiKm978AZ8Zde+Ql6/IyhLRdhGJFhTbRBqDtdvWlOmEJrKp
         jMh5foz0xlmh8Wsq8nAS6eu/VhU3jtCfKVK8Q0H22dWT1NsqI1R8f/5vRkLI/mBrQ/WA
         j2ZhtVHJG5aMakW5QWdLp1pSLiIEWG+0A4K7+s704PC4it2tw86o02+me4K1yhfBwfDS
         uqdw==
X-Forwarded-Encrypted: i=1; AHgh+RrHjfw1fO3dn+A4V6FxFammuobDbpuXeY5P3f0Rh6hlLieBcINp1nZz7qmOrukLyVfDIfTfWcGVci8hvGIg@vger.kernel.org
X-Gm-Message-State: AOJu0YzXD9cBGYcxfRQ2FAeuhCkn9Z5aX8P+1a2APvlMo1xpI43jHVcR
	KmPqkpSXlFsKFPykurSH9x9fihj/tF6La7lzI3y0S7lMTkZnYfrQH9xKxo3FU3GGag5akgKjS8D
	skfQfomUr/r2FOYGGl010HAAE/pQ701Y70U/evCP0V86tTWU4uXaWPpZ8RWpI2saOpqpd
X-Gm-Gg: AR+sD13eQbuzEvG6RMdoi0oPGPXafXmuX5NFW06GF/TgXkiCAlfeg6laEq3C0RPNJsD
	hqV6Av6yawnkujVUGrosI7Ime3PywpkrM/tZehlfOJ+6uy1MEiOW4gJp5t1w2mpOhD2/ngBfDrM
	XM+IyqWPgJXf8Iwv1iq81R8K9S5IHCZWrM8S7c3PhZ/yP30AOAT8MX7+liJ6POXAkFPwRTxjp04
	xIt6xn8JSgV/q9NTG8Mf6wY9Zx1H5DqiGym2gapCr5dBMBaa9FzPP56eFT+H3GHTqxYB87wmov6
	AaCL4qJ5TcvVkcaA9PaB9yZ6BiT1g56IZNyFsanOzPeQI6iaCKeLLhZwH/A5vcbOMii7EpJ3WUI
	5M0+R50DHEzFwiQ==
X-Received: by 2002:ac8:5d93:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52b56671733mr224087731cf.4.1785849743975;
        Tue, 04 Aug 2026 06:22:23 -0700 (PDT)
X-Received: by 2002:ac8:5d93:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52b56671733mr224086691cf.4.1785849743183;
        Tue, 04 Aug 2026 06:22:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fec7cdsm88266385e9.13.2026.08.04.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:22:22 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:22:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech
 ft3d81 touchscreen support
Message-ID: <wj5vpe7lhcvvj42wndplekctfjegqpwzupwyqmaw6wf6rhgi6b@maii6v7rz6l3>
References: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
 <20260717-add_focaltech_ft3d81_touchscreen_support-v4-2-5dd091e25801@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-2-5dd091e25801@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71e790 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CtdSQDPJOJc9UmKi9akA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNyBTYWx0ZWRfX7xyV+P2cGrbn
 7fuG5VVErgoGBRRuj32EgILk5SgKexxK3kIeD6zlpiOjEySAorGqGs4l60wIopSnJYXyBlnpwPC
 KLoF2/1pWxWVqsC+BZWNK+81RTomMkwavRTqtAL/Jc3+u6gsWIKQh3bL28F6S1g318u1g9gnUmp
 ASq/NZ+LOiZbxjl6ehlsdtI6Xw5gQ3tuZl58a07h4QDq5GbQvZ0N/0I9tLSXJUWhKu/Zp0tfXDh
 3SVeRGu21+bcu4qE3++HsJTMZ0+H6y6TVjcSME3/yL4LLIijEj1dYuFXSR5popiTNr8hY61+TWZ
 CO8SJgPwjk/F/YuWlezwwQ42WROL2e3hwDGxpQsR2DVQUkpkScE9TkL0UBXd8jDJn0j+dbpw+oS
 pjMT/NwICuZT2213d8ippYJd0Yp8RwwtqdZoyc+0dQEP5da3YcWmtywRlfGRfxse8SwqSNEYd8C
 Im8tJKKX4qSoP/PdlZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNyBTYWx0ZWRfX8nH3kLbRUmo/
 eoBHZ27bTqs+cHMGyCkOMLb2t81NRB3XtfjQ+VcIElI8U6wx7kHHZEJ5xxndWueazRIWFc7w2wA
 HChM2u34/TZy4USrepWy4IUVmsMbrsg=
X-Proofpoint-ORIG-GUID: rfy1B0EJSbTCCJON9BTYUxT1vCKSwG-h
X-Proofpoint-GUID: rfy1B0EJSbTCCJON9BTYUxT1vCKSwG-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040107

On 26-07-17 17:28:35, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from
> the one used on Hamoa CRDs and requires the reset-gpios to be wired to
> the device. Without this in place the reset line will remain
> permanently asserted during resume leaving the device offline and causing
> all I2C transactions to fail with -ENXIO.
> 
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback():
> i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
> which is hardware-compatible with the ft8112.
> we have added the required change in DT.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Fixes: f64ef325f1d9 ("arm64: dts: glymur-crd: Add reset GPIO to touchscreen node")
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
