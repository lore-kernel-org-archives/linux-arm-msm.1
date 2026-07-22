Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0F48BD35
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711116; cv=none; b=H8UuosXdCluk9C70mjJbdScSKNXIe5x+F7yL5Z019l+pkIwf6mFSo9wRfszIQ16QYFGa+3eMh+RwJXWeLBjAuKG486gAtcaE7bhUtqtMObb6/nnFxVoIFlMruQZTP1R4WMCOCWdtI2EXLRktkXLM4EXtjp4p/Tq/ngHHmuSQayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711116; c=relaxed/simple;
	bh=baQJb7Ar7ZmU1hhzXFo7f1CrbqEmCoDf6IMkGA3MRCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeQ9NAWiqdXbwcSqMYu6U249MzMV5a2lmGdnmPe6msVqM8Ehx35DJKx5c+/L8RUBMDvpfNXkdmnsIqr2CsL14WhCTemPvguOHOFrGuGn4ZTPTc60W31NIESykYGfWH5bm0agBCKemrZqJttQl5234AhGc/5IRzsQ6A3nQqBfNQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lb+Y2MtE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idfN4phD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lb+Y2MtE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idfN4phD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xPRK412647
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ye0pmBSQNQpD1Ixqlj4iy6xz
	BJOLNvLjVgnEcTk9udc=; b=Lb+Y2MtEJL6mOdAV5TsbUJUb129e0wN+miUU7+Jx
	FKNDJWSplwfsPeWSA75BTsexEAgrOjgg8YE2bYUvzSLlzXEUNJVCXwUydVdYS893
	bOdOWNDMD24CoHqRbkKyJEpijqOu4bn7zvMBMriMWizf/yS6JtJy4YcagRetnnK1
	gknUkbWROgC4UKkN0FHfoH55XHKq7TXfJNJhzW639SSxUN44c2xVgDSvcEDLXlDB
	hCs2m+PgRXrJJWWXe+ORcJfN8vHz/dpE2IHrec4BVz/eTrs4SYxmJFR5yXpAhA/y
	BQNfKX8Zd9oVPNXcY8UD0aKKtfcdblHCz2wjkpuoVOdsiw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdh1hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:05:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so19077527a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784711107; x=1785315907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=idfN4phDfrEQGy9aCvHaZLynOMXJzXUWOKj7HY/3qZdXq0d425SmMDhJNuiLE658Cj
         5Fo8GseAXXHXjuFaxmHVtnUvAEkXj96k0hcQMkJsDhu2qJU2woylcF+AnY++65brfgAg
         VwQetQ3Hupy4aT+FxpaOXCzSwO6mGmQGM+qK8/70B8mVOLwIEcXu44uslPItRevFVKZw
         Tp1wYFzbSZfX5+z6YmCYH+RcX0GUbjyxN1PQh2MS+8SfetCx/rgo9vF2CL8D9nMH4M+0
         q19634XZp1XustaMzR5gpwiC3KUdTmQP24MQ4UJr3YYSLt4jlgtXQSPlB0fXAFzyaWoY
         Yt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711107; x=1785315907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=F/IR8pFpvkmGF0/qhEv7jgPF9qrTLFLoFl2TM/PFeiOOnHcBBBqoiCcrCEiXybzpiD
         vC+YNiuIF679og2OBtxVCRJJlhmKSmYInBH320ynW5oxeUmbVAiYTgjvCrT7FJWy+N2a
         AHmVp4BkSLIYdIxadWzUDyTGs/70Vr5TjXxxvQEWYivmHBeUumsRXwnT0+XETP9RDt2R
         Kwo4FTebq9ojI6c8aTQ+g2L1VTdjlZEYzdSMunmNjC5VUiQfI2lUBya9KQBew7hePe0V
         PwkM3ThrrsEMQtJpJAlKZakYz96G3nROpB5ELX+oQ1MHixsV7rctSm3uwF+TPFnmx9gS
         4siA==
X-Forwarded-Encrypted: i=1; AHgh+RrM/yotDhimUsmd0vTyulXSXNvYo8N2Ca2mg8B4cxYjKn9d2r5BV/OFw9pgCj0aqm7ERPX1bPQKnDdLrqcz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1saqeu7A3IRCW03nPiiwaoBQ8KLPBFzFcunrRRxrwcOW1mq56
	NerAzaDLwXCdc8Y1UecjUyPshr1bBrBJw7tAlMFJgQv6XGC6PB/9zFvlCckh0JO6if7+3NImuVn
	Ja5vQRep4dnIo21+H0BaoryEzQ7Xc59dgK8d2GvcPKBDtoYqOD7ukXwrNv/5ck7Bd5NP/
X-Gm-Gg: AR+sD10oLPxjKF3L/S9R5xEYDG5odU3owG++IyQm2iF0TpQHCLLAHxTSBHStskqhQW7
	G4EBXgWX3/uB0axgRoUsRSOd9nUQ2RaarKtTKJNfPymfViJeA/q2rxcjogE+aHw0KOu4D5dCxEF
	WALPI8vz1lQASG/onPMSG83rNzQKrdFquY8HksKQ+mUUzIB4joleHpOPfTIOQR/E50WEwI+993D
	AAoqmmSRRP+7A16y8vs4ENh+VOGzAJBURC0ETbFI+L/wuoziid9VNsfSvbXMNiW3li0rjjuwaix
	n7l7LAwpxjVIgEQlOF9UllQiqVgOxlPETqjP0qIDt5aSfKmr/0+F2Ruz1OFGZGpG+ji0/xBH9m7
	rlt+u+u1VBRdI81tf+QxQVlERwIgmy4CqAg==
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634883637.16.1784711106485;
        Wed, 22 Jul 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634822637.16.1784711105994;
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm6811568eec.26.2026.07.22.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:34:54 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Message-ID: <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX6qkLBNM0YhOz
 Ezm2TqnzalRn/yrVW/y02k/oWgmHUzuxnh5nkDE+Vg6pCUvAa55bv8P620c0CanL4FEyKT9FTqf
 OPVX+8IxuJO3JwKmY6A+/O0cbPT5NrYgMPCxf5agSd7V0yZQgxyjc0/qS19zGrs5lJIkqsLAiJp
 s3mCTrKwXmW+F1C1+rMCZwZ8NYirUK6fHBQ9Lvh5gOC4bPr5nLMs8ZNeZ10/E9hv5CnFa2pAUac
 Wl46vKLGiTVkJXrX+UJqWiteNI+2N2dHr9MXK6zH6szjrjXCqkmqpp1/dgGJT/+awnACPmk8RXY
 acpookVdPloNj6RitVIysW3grob8sbvez4IlovpJp0HqFrplDkgmDbD/GdcMU94W0+r5nIIs0SD
 /FZRSDpDgAu8UAs559kFDHu86KHp8SEUoXghPtMGOQoXAqY7KbVjojmsQxqDvxeVYD7WlpQ1mmu
 ZILYoAE13xhvbLWoc+w==
X-Proofpoint-GUID: gDg6aJAiLL0QgCm4azktjmX2yUkvu18x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX/yZogqxL/+aI
 oNFiYfs5jhqkUxNAPqiOz2UKnVDXoNo+DlcBPtldsc+4r7XC7/qJx+m+yUnEIdwaN9IczX5GPWt
 3x5Uno7C21QY7D1eeeWc1f9WVGnDohA=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a6087c3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=2P-C3DqZnQur8SwEehsA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: gDg6aJAiLL0QgCm4azktjmX2yUkvu18x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220084

On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 34a81e4b4f95..b216c7595f7e 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -4,18 +4,34 @@
>  
>  #include <linux/types.h>
>  
> +struct reboot_mode_entry {
> +	const char *name;
> +	u32 magic[3];
> +	int count;
> +};
> +

I see some where `count < 0` check, should not this be size_t or u32?

Thanks,
Pavan
