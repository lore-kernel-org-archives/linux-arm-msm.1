Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8641D119
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229898; cv=none; b=Y00XBCGSaBKwDODCvoaLVPWlXvuxwCtwAyslqaaeaUhsQh+qQmGq/gQ3y/hMok04laCiv8IOF7w9iH2iVc4bsT8P+m/40mdhwYFVLH0SEMYRG0VLypxytWTcCrMWyJC6UKRjpGAqGfpXfXG4kEELPW5c3eawNfOZmUypl05a7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229898; c=relaxed/simple;
	bh=EmMkbudgday6pa+6bZXh40iZJi6gdrgGTsD/lKEGPAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9pfGQeaYyY9QWbCj0nBPSPyGoDCtFeFQdembFRX8Mo5aQ83rAsyxr1BtEu6GEv1C1DAD0n2/KBCVHDQig3NJNkJGQMR1OH/iKX5fUzU+M3rUVVjh59YcoFVtQGoKfxICGqVSHNUiHydEjFF0nhueDYa6ohWjsBglr//sY7Cgdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgsW96Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/7Yph9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgsW96Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/7Yph9U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S829ej3294990
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1DNkTRN5a/54qc37A6bttfGfqf4yxOXlW+KO0rFAF4=; b=WgsW96KrNoqdGqZr
	vmT/N7YGm3MLgKg69DIe4yOT06GllIUPVLW/Km2M4DpoQNywNs9ibdHnJ4B9IJnV
	hG+L+ETDPbwJ8PWY5TYpNodLDfTa1YAoi+v2Edob7qwgsiyKV0n25CET9x8cE2ja
	NCy+eDDQWMle6gfbXqu6k5oVjlkCWEJJGkk/iDGB39YnTItJOk6KtwdGxQDIdk42
	7AqUXWDNqiWo0xS0HcJ68AU56aROr5GUKggqorb+r4BC3Go8mfiPCjE2UowF4lcP
	zg71bbdTN2TG9Ptsw/E4wv0LWGB9c1bLerGxLEVAXbjSVG2XXL3v9hMrBuSH+chU
	ojnfVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5kfc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:11:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso47167791cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785229895; x=1785834695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1DNkTRN5a/54qc37A6bttfGfqf4yxOXlW+KO0rFAF4=;
        b=D/7Yph9UYmv0HFw4/sFvs0RmDL5IQh0Pl7QSzW9toKbMx+NAko6cAzgGvYdyNIZjf1
         StzFIvz6IjQpjIw/NyYREIdkKA067ZFEexdpGRREr488IgnK7aGxfGgX81FjvGvATxVp
         XEY5pJGz0On37JoGpFa++Lnklcq1OVin3n4ULyMASO0PfrhW81qsD/2ZYKtTRs8vTLFq
         gsMD5JMCDl04gGrRR1pnNqQ8RYCb+is5/oeWr5EckiF4Au14QytC2ws+qKgbZTZE2U70
         1jYy30oijy137unhLYmyhyUtQEo58kotBEeHrHSDbLSG6nOVuDYX+gHdCeNDnX/wetPI
         XW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229895; x=1785834695;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1DNkTRN5a/54qc37A6bttfGfqf4yxOXlW+KO0rFAF4=;
        b=GZaDkvLpy5oHlRyO0HP9Mv9UEX+ILbtoRaT31vrJYu9DoRBoaDyvDWY8M2D4OWlaWB
         e3ebMWk5kjrXMyvMIZuz7RZ8s5lan19WMRWLM+FyzoAv2uL2u9ENPnemcDqP9G4Nck0X
         DqnoyZmiTYOqbNEp9RYbjdW3XYnVG/mRRJrCXSvPsHglCTqNHj3crpvfVE6Xr9ie+IBS
         HPJVohKzVpEIUR8Ui+ZbgWT3clLze3U2KxfSvZ1TLWpNJ+CPvpNfe8UsQrxYIXJ19VPH
         YRIa9ihNtF/X8ix1rYZYt51vTFFzKlies0e+E3Xch5s2sdflNjGa4KcReQtCJQUHT9CS
         TwDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqgdss1uFE1OKZ/vOJ42CzUJLhnblhaU19vIGGiDzT/+hzfDkM3jR1TAKIqaL0dzWg0ngyikVEYkv8UUr6J@vger.kernel.org
X-Gm-Message-State: AOJu0YwzAvbmdg6IvYSnuDVluaPgJLGbe+nDorq7iJVma99OtGAqxHZn
	XfIvKzbO1uIhUBAr5XBrbI/ZRZJZD30DhvlFL27L7KxlEPfxyZyll7Lj0AeBKshXb86VmaHdWqF
	ohdDgeFcy1t+NzooKlVSu/a3xMhr7m/E6Yfc0bmpabvxAhT8ttHyzxnyfDvGqI+W7cdHL
X-Gm-Gg: AR+sD11eRoM3Wd2NORFHPh3drYL9tlq58O/XwzaOGvvQNY1DJWS6zUA6KBsYrh9HlJn
	McN/jQntdlGm3IzviK9nqFm0hCuRwKGOxEVnk+bImm4K1g1/C+EVOvgVze2tuDAZb6Qg0CL3ftM
	nv3pvCB2L3QbOQZ208OzihjGhLJ9pSBscry4JaETCj/xoX/tLCWH4cpzqAW/rrUdMEIaPcitOoU
	bKFSlNT3+K7s0H5Jt4lnzx2IxxdXfowT1795tQ8i9XKnfKoSvqicRyd/yZ2LsvA867amriDt+eW
	WgNGtNMB3cyxPDimmVWJrLHwiJsxVToUsX0CLwEw3X0g5Lo3zoV99Loe3FEWu6S3N3l+I5yIlnp
	WFtoJMHd1jM3m9GFUhKRjDsOkL9xd
X-Received: by 2002:ac8:5a0a:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-529d6e06aa1mr12258001cf.0.1785229895514;
        Tue, 28 Jul 2026 02:11:35 -0700 (PDT)
X-Received: by 2002:ac8:5a0a:0:b0:51c:b900:5136 with SMTP id d75a77b69052e-529d6e06aa1mr12257581cf.0.1785229894781;
        Tue, 28 Jul 2026 02:11:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d2e3:b407:476e:c977])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm58043342f8f.6.2026.07.28.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Hans Ulli Kroll <linux@ulli-kroll.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: ipq806x: mark gpio and pcie-reset as GPIO
Date: Tue, 28 Jul 2026 11:11:32 +0200
Message-ID: <178522988754.9776.4844459868316856051.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719134548.8830-1-linux@ulli-kroll.de>
References: <20260719134548.8830-1-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3OSBTYWx0ZWRfX8C31+a22Kek+
 mUvM5E3wJehEYypNOXu5Ep8cIK7l3LoeZcZcDkUCPBI15lWopoNzdORsAbTNDc8MXrtBKbCksdk
 YqjJte1D7Jfj6WR7maJn2ruCXurPKD0=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a687248 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=diqNrFS-WVA_1NOh2bQA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3OSBTYWx0ZWRfX63B3JIYrNrsD
 b8lgGEWSENW7FTwaiOD11Bxk4W/E+bNEsAQYRBKx1L56ZXsh4qnNYfGHU1NTJYMCz8/L+lx9p2M
 ohy3/HKn4mr4jUII1/5p7qVWUwyMpveRbFFLfp5Tva8dfp0nRPwkW65wPEttb4GCDFwQ3WEPRcU
 oPjh4ZwV/J2Rh9UnJn/7B7bN5qK8aQh4k+eV14No/IdRucpIUtRgm5DGom/BHCx0nRI6bP6FllT
 PImNWOdQ4Ok+hjzW6Tu4S6gCAPFlEu54y7yHOONlSJ0XXGKF/v5Uig+JxgsPLIHUum7CEdmLc+R
 Z6VjlYEEEobfmz/Dm7yLJkpR5XeFxN/LYAs9ocBILr7l88t4S9CosmRGNhTrxVrppGUgjBLRjuS
 dYpn06bQpZgUj/TnhDwasoAG+8eXaLQ29Vmq1M3G0EqB9om+5zLyOp5jTJuzF5unOfbBvb5FHxk
 BoR0glPrCYNxE40Izpw==
X-Proofpoint-ORIG-GUID: tuVjYjPY9ZRX5fBA3ixzg-0tmZXqu8-x
X-Proofpoint-GUID: tuVjYjPY9ZRX5fBA3ixzg-0tmZXqu8-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280079


On Sun, 19 Jul 2026 15:35:58 +0200, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> ipq806x still describes its gpio function with QCA_PIN_FUNCTION(gpio),
> so it is not treated as a GPIO pin function. As a result, GPIO consumers
> can still conflict with pinctrl states that select the "gpio" function.
> 
> [...]

Applied, thanks!

[1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
      https://git.kernel.org/brgl/c/687f39faccba29ab26de965411db37e849af8ec2
[2/2] pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function
      https://git.kernel.org/brgl/c/fd46760956509f580f7d3d25db4de10e7c6f949b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
