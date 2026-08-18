Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5666F335064
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787094474; cv=none; b=bMbkqjBiwTgnAPD502VFP2WhGVnE67Jw+EaFSad48DqhxIHpiI5DQVDratgdcwiy9LoPaHlIjYoadiyWkrVQ5e1fogDvBJx1GUEb0i3B0moEktuNZXFjBu9gH7rjq16ScJbo/seHlGNyaABfQGwx3GJH71+aqCk4n+0k/AaAXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787094474; c=relaxed/simple;
	bh=sCcVrnoH3hv7vhxeNYX3jXxDbZO+Fqq8DDR0TUdFeKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQMudSCbUCRVMaCOQezlVo8YL2KwG659KAqVzKoWAO183CuEdh4q4ltEfec1CBFwwh5gp6zySc4mu1GCdGmsZ0jtnXRAUejcONwUrY1fcMPzp9Wq8c3dLNA0shJ+DdtzYQS+i4/xj5sOg+KSMMS1rhKGQkcNMp+VK2AVkWBhUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwGqZC9A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvGNoi4w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwGqZC9A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvGNoi4w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILb7qf2105653
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 23:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EnZ5GRyuc5JsCaRheFHmyJk8
	ikA2pyS+nnM/VpnIbsc=; b=nwGqZC9AMzECgdZoq5NVCiTHycEoBKLUN//HySnf
	sa0Add5FNG1BrTYFQSMT4AEZCjfND/JI9jF7DNEgBOCEYbtJuVuI2fSrqapb18zr
	aT6YCg3vQfOa1WKSS04R4oCaBUi9InfXTHtlCdNkttR7QpXXQuf+YsD9DrMYK54B
	Viqej3Xrw67f9ByYUBnzfMPdjNLeu+fbDKe60K2iTSYtIRv4tb1npYQIm9BB0Ml3
	IwdXyH38Ij57jQkguNJ9x+Ahd6alWche94ZcP0InikLnnkCRiEAb7DYhPcsNWfY7
	k5tD/uRvFp0SmscNgxH067FVHxis3CLPgbf8ziPd80Phug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffg9n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 23:07:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso45174385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 16:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787094471; x=1787699271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnZ5GRyuc5JsCaRheFHmyJk8ikA2pyS+nnM/VpnIbsc=;
        b=EvGNoi4wTXamQVWRLGP2mYq5RQd81Atl027HtiqgQ4HHfZM4eLFTUs7frbbHeI+LO5
         5GTr6e78w0Gq8lYXntAJ9MNcCVjudf4Dbwy7Or4eK8xWM2hja9G6hHJlAfM+rG93kTSY
         +gX5qAdXZ9LLLIxBJ9de8WWOctd5N5r/A0Uw/X3SQFN8LdPsNXcrfZ2aTB5iVzLpqaBq
         6PFMB+8bee5bakcQU1+5a2o1nULF5hLVgZ/AkVNTZJdmFRZv9XmyRn+Nbfw8KRlxkGXX
         R24UOuLiwnwKuFKbZkJ4Wpnixss5wXctukAyGcOynBVMCFAnQ53voyQ2nnh2zhdmTJ8D
         ZSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787094471; x=1787699271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnZ5GRyuc5JsCaRheFHmyJk8ikA2pyS+nnM/VpnIbsc=;
        b=Wu/ichDb5vxf9W7XkrrXt0ShdzzYydkbsePiuc81nvcF956/jpcLpafi8Kd6e8EeIH
         cg/nwXByxmMD4ZhkagXQ0mNVcujLZP8LQRnlBe3bPwr/+Uo9BiNM6y4GorzLtk1SVQqz
         PvwsYHGmUBIidEKCfVvAvwUY8bII4LuRYb3QWq2cjo+QPJSV5M6opBZufCfPAfwcVwnm
         NapdgHK2zjBmK3N/zBDfYepAYAtrKtTdyj94R4lhSi6W0t2ev5qUTzJd8ckGKvV5eERl
         r0A0NTg5cruaZ5XVpGW8iYdr/J5DIWm1oRzzXrA9MFtN/giXDl3Pgn1/2m4BbxTDwkkL
         miQA==
X-Forwarded-Encrypted: i=1; AHgh+RpAjZ+E+eayI7rjvccAVMsSW3LhuTB68YN1w1OEq4Bklv79QOQ8UaOocLuTWwVA3casfBV+6GqbbX+ytkXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtT/sftv0jidPI2jHjDNbAMB2K3sXirooMBBCFR+5h1905pm1J
	2jtRBcdWAdOuOyip6RpwYPgYzCs/MQX59ncZREme5Bi0BmOgISrghdR7cTau43K8q1sfDP0ORAq
	lidCKujSG8gEIAaIvUo7bn/cU+OYpICv9f4eJJpGeNSMKsYkyXSsWqQmkOpC6mGUX/t0/
X-Gm-Gg: AR+sD10d+3yNOSjR3UqrOHYHHh+3Y6616pqd0ueNACbtWDoMQCOSFanKKo3BmC2LNbG
	1odkVTXReKxTvT4dE54TRB88nU+rn+mNLyoTN16AkXW2Zyn44un2NWJna8I8BErJ6J7k3ekfjvN
	FsoZix5gnbS5n0sGz8fTHPaS5y2xt+NX9rMrzmV6hw6WVtA74RCpk8+Jp6fpzwmBemVYQ2x2Hqc
	zf0Vf4ZHqGNBIxDJsGPpNXg7TvA6HCO2cEF8FACxEyHzbLVgo+ErR2WiA0INu/EkLHl3IpyC/7X
	fwiYXN/tuc9qscONsC04nzyU7KYvedx5wQjwRudkEYCNuJPzuLI/i0riubdEc2fQ0iXp+UL7ReZ
	tdTrptoDU8sDS14nmt8DjvstEF7JD/KISe5D1xd3lS2/FVZYfqbwc7GPYYNSGamaJwn6NtYX9em
	epIFrCCXjadNoa
X-Received: by 2002:a05:620a:178b:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-9371e1e26edmr95062385a.8.1787094471331;
        Tue, 18 Aug 2026 16:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:92e:d7c7:7de9 with SMTP id af79cd13be357-9371e1e26edmr95058885a.8.1787094470881;
        Tue, 18 Aug 2026 16:07:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788f58a6sm42251e87.72.2026.08.18.16.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:07:49 -0700 (PDT)
Date: Wed, 19 Aug 2026 02:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: oe-linux-nfc@lists.linux.dev, david+nfc@ixit.cz,
        krzysztof.kozlowski@linaro.org, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: net: nfc: add st,st21nfcd-i2c
Message-ID: <np7x2fgerwo4timehrkgfb5esaia6aowxufbyqapfcn3ubteqh@7um7soe3k4zt>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-2-isyourbrainfoss@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818205940.1973944-2-isyourbrainfoss@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE3MCBTYWx0ZWRfX8x5eUpudjn+a
 6+cWzc4jLTZ9bF/4QOvevD0rkjlnIeWRE84Sb0ZNM+c/IzelrPdFpdmAlQQ7JW9PEDiaXmP5QEM
 /rFrF+NwAM4BKSmUREaWzYWpHVD4P/k=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a84e5c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=AMhAXE7b00SPKp7YA6cA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: joqZ8MUpQG4HckcTUXGDDSJLWcwFzzhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE3MCBTYWx0ZWRfX7Yph6L8MltQ8
 ScDwBSSNyJpcltGfi7TgPgfkcyzSzpYfzRVgndpBxXtCciTPZXc/xambwCZ9SrLwY//xQTWB1Wj
 3VJ6p+k6AdMsGVKRdUDIjoYFsGoLTZ1NBJz6+x9xybrcGx4l3J0XhqRpn0I8435v6rkAobLSGdH
 7F4EVcciwurv7yOga1AcnESHVf8l6xBkuYdKhYqg68XK2+BeS/Y2D6t3CHT3FfYP18mzuCZyPro
 y/MRaYfLdtQPGkVGHz0OoDoj7ZLZro9Wqs33yzwflFl5QwyMdmqJ58OZE3LXlzR+s0XIe/QsuMs
 V1z5i5TUTPtcTLjMcWdDXfcXXUD/xT0yHfwwVDHZQ1BuBK9PpANd44T+uVR/20OvQVFjy7iQ3QK
 OU/1QLCxLAieXxyPvyWvQqgeFHhUigyiBNIzAyqS1Hmmd8bonXqVuofrF915DR618oM3sljY6Sl
 617n7fuI7TDlY/pPT9Q==
X-Proofpoint-GUID: joqZ8MUpQG4HckcTUXGDDSJLWcwFzzhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180170

On Tue, Aug 18, 2026 at 08:59:56PM +0000, Kristian Brox wrote:
> The ST21NFCD (e.g. Fairphone 5) speaks raw NCI on I2C. Existing
> st,st21nfcb-* and st,st21nfcc-i2c compatibles stay NDLC. Add a
> separate compatible so those boards are not switched to the wrong
> framing.
> 
> Also document the difference and add an I2C example without
> ese-present / uicc-present.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> diff --git a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
> index 1dcbddbc5..3523a8df0 100644
> --- a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
> +++ b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
> @@ -11,10 +11,14 @@ maintainers:

Please don't use PGP signatures when sending patches.

-- 
With best wishes
Dmitry
