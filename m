Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1443BDD0
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927609; cv=none; b=E225WYb0nkpaFr7uDlXu6ZOBPtF4Tc9A1U3q0AnwA4CmqnpB45pPmolWRyfeHVH5A1uRZmHO59RHJmpmHUtnpYWCCDSR3ZzUTa1t/DTaNU2rnZJ54I7YP8DplRAxT3T49eK77m0usAAFztpVdfeFH+fzd98Ti7d7hj3xeSPMKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927609; c=relaxed/simple;
	bh=o/RvQv9f1ZtZd51QR8FJOZby6EqzahPJ2E5K519w+Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rec+gUXOmKRxgVVQnuDZA+r7WcQ9l5J62FYMCwzt+usEiSwqjV90qJqjbYc3DlRpFMe1t7nbwC6AVcxa1YBoQGImS/APEflr/5fAtpezQbtgxdMW9AH8vlQNM/zAl64Hz2Jp9C+kib9k7VJnnlg3j+lBYmZfdA8Gp0khthVbWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FG8vwcof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MG3XxAHF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FG8vwcof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MG3XxAHF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j3Ab672953
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 07:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6leoAHiHC58kTdNzD41rzsHZ
	ue8MEp5AAZ57oKNPKQI=; b=FG8vwcof6+Yymu+Xm20Dzq5uzPYgxmE7Oh+3KmL9
	4k+05Lbc2lg9qKNEPq9qtsiLUBRv3VR4dETGZ10i/P9o+KNQdNkUM7EVqedL/Ssa
	KK27jCk46B8ABvKq5zQ4XEA+fzDqbLSTEIu1HZ1WXYZsdicLSoJHYn8O5QLdi67o
	zemOmMenzMGG/BDqkhJ71t8iUVgI+KjzE6yKdJuOUIlfbE997K0uT7alHIK/xHZ0
	Oo24b23CSc50iIrinWNXkSiMqqLn0UbG49MXWuQtqjnktqJ7nEcX7AY7U3Xse7TO
	eeDAsgdGubFKFokXl9S49mTv3V8O+eOeXtKjEX/4/NsuPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tj55t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 07:53:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d43c9a55so181268121cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927605; x=1791532405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6leoAHiHC58kTdNzD41rzsHZue8MEp5AAZ57oKNPKQI=;
        b=MG3XxAHFb0JhwLhs2BpNOb232fHRYqzi7oqgOR+NIVQA2R7DwGRbsmyTsHRBPopCur
         0DKnxfF43tLARsyjDcjSTq0sV1cX9mV6CT9g3yoISe4UFIn1318CCJ4Hj6tqLeVp0jsT
         qg9ivf3KCSySDICBVrAKxh4M9xHEsdVluqXvcUjrvkQ+ubnHTHDfhZrLJyK1zdjcgL5V
         0cyjPzqamjD4NlUb+sQ8VvI3preu9Q6Mj/960xvvvuoGYIp6xfk2np4bYoNddi92+c/3
         kRE0GdZgy4KKTUl0GoFZhAoY/15k521by5Vs8HAil88Cw8P6MGECbDhDZiuJmhlBAucV
         qjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927605; x=1791532405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6leoAHiHC58kTdNzD41rzsHZue8MEp5AAZ57oKNPKQI=;
        b=Kjhdybgt4LiEh/KuIEqTGAXpHKx1uwm5u1DJxdsyLEt59CEJWlXdZ6iDTqRbzf0Dn+
         PTA0R6foXgGviDVGQGzqiAqBB38GgmzCaqZZycnV3pzO6KA5BJPyEGg67c+FoPbGyxQl
         1a1PQu/BMwNeZauJYaelOFGAex1X3FxXmBOUM2wLDhljNUwcEmXVWyr+iAuHIyXASA80
         ywdewlSoiogZq0YtnxjaDFm9mM1JHIeI3rOxk3CohGInedou3NQykX8hanaVDB2lxRNB
         4DtQfS4Vlcwg2bjpSCEGad2fYl6PmEh3i82ijvEIpyoEzoCRFrE6PrXZnSSIHb2Nw8W3
         u7uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPPaOw/i0I2jSMh3UUDQxueRnSBOzjYlby4EcSTZMhmMZIwDIdp36reeQBP7rHdrz/NvHfM9fpv5lZk6yk@vger.kernel.org
X-Gm-Message-State: AFuF++n9j4RLndhnzfd6DvwvoXs183bFBShPsg7u90C3S4TtnOcpMsfo
	SUJgbWPxSrFw0Ej1LBHvAITQtw8fXOpgi3JGn/grFHwE5hDHSawhe4RZ3CK0NArmoliLjIPr8tY
	r95zR7iz4i7Ej45UPiLPWVbWUdPt+FHtFKxSj1aCKj3Gilz9yy4HGoFwsgRLE/xI99pXr
X-Gm-Gg: AYBFou1tXv+H8TCg/jW5sWqJ804Dgg/4aZtGnLkD4sMafblt9NES3pT7VEoCvgIdtt7
	DML2+C9KorVPdMWioS9ee4NCMoOhV3NnhN1E1Hiz3ULhrHtfkUH3n6ktVglVINbZ+9dAbWVDT77
	KM2yLl/KhNMelzGoxHk0fpi3haieQXF3++bMt2xtlqNXLjFwxNyVT3mfs6gui1uZ69Y5+r818/o
	rhwEXKUp2gxUHLoFwg0ajcp4R2xTSqk6fSxBIjjamIsK9HJKSfTE+JTPH/ojp0qlWjMcg2vYgD7
	9zapIJwp1LSJRt75VgPSI6bfGa2Qt7APp4mHKOABkGg8rg2RFJm+nKLcWbcHbtSm9JAVBl603N9
	RD4bKHFb1YAGcCOg4TKKY
X-Received: by 2002:a05:620a:a0c4:10b0:939:fc74:b6af with SMTP id af79cd13be357-93cf16b3fdbmr230239885a.11.1790927605361;
        Fri, 02 Oct 2026 00:53:25 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c4:10b0:939:fc74:b6af with SMTP id af79cd13be357-93cf16b3fdbmr230237685a.11.1790927604917;
        Fri, 02 Oct 2026 00:53:24 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fad53sm4411184f8f.19.2026.10.02.00.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:53:24 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:53:22 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: Re: [PATCH v15 3/6] reboot: add parsable tokens for power state
 change reasons
Message-ID: <ar9i8i-7a7ZnT5t8@mai.linaro.org>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-3-7af87107e0d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-pscrr-framework-v15-3-7af87107e0d3@oss.qualcomm.com>
X-Proofpoint-GUID: ttDoEStzZdsVtM8t28uf4Mf5s8VPi85M
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf62f6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=WjtHAGiS79jxuaiHvU8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMSBTYWx0ZWRfX+cDrgYcc/QM/
 5qF1j6Fhx3kvtsWwKp/hhAOvPiVdUvIRsr4RlvMUtaqPUj0S6I0t4olqEqgNTGUIVf5vtCD/9eT
 zsrcL5IjtM/2NuVQHQaGRKyDTEdUUyyXVlSfaCzQABOhM/lzFhTfESQeFghIS8qovGrbnos2E86
 /AjTKPkPA4sjYfUtRZGJoTCCkkV01G+QZ68B6Da1rQuTDL1ygkwvTZX8b2qGryUfehv9uWsA1/U
 njTqqebIHJ6fnhb+e2xFl7GzIPC4j2ME+pO0yAk8LPNmQrqYxQlNbEeJ2ZvjAzWuWH6PkRiBPPb
 7dXQgQYE4+Nj0FN9orQyxs0BYDL9qCRMAaeb1qem3mBb+D67+uh73Tv+a0Xbej4JHlrTKZ94Xd3
 KQRMnCzmzmN3SV1M2BToLAbeGr2BWvr/HQGs79C5+68O30FE2l8WIDto+ekdtRr8gbaDoedikzc
 FXokxmZGxTMPrwTtBuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMSBTYWx0ZWRfXxVxiz36DUl8x
 RxDRX4iTKd+DuVlXq0a+H9RZVJkJ/T5qixkbY3xZoff492Il4OxwG9TfKgDJZ44OSfmCesX4Gdx
 f1D1owJLEsA9mD3IwT733YrMwX4JcyI=
X-Proofpoint-ORIG-GUID: ttDoEStzZdsVtM8t28uf4Mf5s8VPi85M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020031

On Thu, Sep 24, 2026 at 12:38:44PM +0530, Faruque Ansari wrote:
> psc_reason_to_str() returns human-readable labels that contain spaces
> (e.g. "over temperature"). Those are fine for logs but unusable as
> values in a space-separated sysfs list or as a write target.
> 
> Extend the single reason descriptor table with a stable, space-free
> token next to the existing label, and add psc_reason_to_token() and
> psc_reason_from_token() so consumers can emit and parse reasons without
> inventing their own string table.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Chnages v15

Nit: ^^^

> - Add Reviewed-by tags from Matti Vaittinen.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
