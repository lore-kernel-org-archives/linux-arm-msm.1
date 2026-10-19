Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E246D543
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390081; cv=none; b=PgpCBatgSQjBIxZ32WBErA76oTAIQFbRY7Iiw1SNBgHfmYHZ9jc3IrG4Fo+NrD0EwadhbJermiA6uE8S6R6VubcRkeTDBCBc2VgvuIImnEA/FeaO79LUW2HM4pHmgoFCdrGxoQ+OydHRC6gNp+EDrfzEOd4ZVAaEpGLBn1Tstrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390081; c=relaxed/simple;
	bh=duA7B0Xz1GSz7k56DoehqNOkhx4so86WkE0Xspjnnx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daaQa3Y2D1W499jxGS8EPTD9z4dUObu7TTuQMaS2GMQ0Kig8ejY5jGCB3EdsQ71Ho4kJlzYR7NAJmOF5CP3Nv1G8pv4iKRB3V1RD+8jWg07z2EH2HFyGuQWgONESK9ZYcPZYVRy0MNmJwAa20QkeJZwNDXM3xnzXEeP7fHJyd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC3DwmzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmYg2ddB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC3DwmzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmYg2ddB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j3kV238682
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gt7a3hg1P+/V3uWV0MxezY3U
	P7FV/WGedH1bLBk7Y2M=; b=DC3DwmzNbA4G1Daciwzpr4rrE67iqcwqudt/kbRw
	du76hEYeuQZ9HIl0Ha5vbD+dPuyZqLc/dwEJy1nARjS+S/0K+CzR+pGObr5D9NLy
	OuaF7TwjcWr1Hz02tBLYqdFe28UTQBYpR7mlSkUfTj89X+qdixGUBwLuJLUoSLrF
	ZUbwzDQkFxX9zK9KIdyStf6/5E0QDBw8mxKJysZ1rN4hx7LADWy06FD7+119PgP7
	/DkLgSBP9yNxiWziofFxFxi4ZKXb/bWjAUpJI0PzO55u6nFfJ35hJfLuYXTOLJsb
	Io0AfX9lNgpEnyl0lKHehs+cqpT3JAH7VGYKQrbCxY2+bA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k506j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:07:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-186c1aae818so1748322c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 23:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792390079; x=1792994879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt7a3hg1P+/V3uWV0MxezY3UP7FV/WGedH1bLBk7Y2M=;
        b=OmYg2ddBXymg1c2qjZqPNE3PNoh++UTJgp3VoOyTU2d5+WvUuHRTZUCLrgU1kxX688
         Xw9jZqOzB/LYwOQUK5x/GDZFcdyeMeUvh+qFUUV4MGwXIAwSWZo8S7ODVfdKBnCH4dLx
         iN/6FAL324dstkHx7qM5jNDHu5YmYtwSB16HkG5PMDZH6I0sO66iQTXLddmjgoNhgBlb
         McG1i8rtQ7K5Uli8u2Nhma5QAUFzEyXF7XHUA9L9R53kMx68YHmxTIVBBywtirynRqEY
         nqBmnyp/r7ARoZqLQEHfJ62HMEpgb5oGrAyLyqhgkcxUwFXwWYhui2H1nEsiFmjfvYaM
         mpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390079; x=1792994879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt7a3hg1P+/V3uWV0MxezY3UP7FV/WGedH1bLBk7Y2M=;
        b=hhVy8qVFESD8lM8m370BYcazKUsEQY6+m+Z9pD5SV9awoCTnNilN2X+q1FAgiEapl4
         V97wpdUzkj19mwdfZwfm2D18NSW09xwdUmcLO5mBn8upf+Qs2WpPmvy7UeIFzosemNsM
         l7aWeaJMDuCoVwRXeHYeQgLpb2/ELc6rEMSMNqjbgaZm6ijcjHfHjxQizHKaHmqVCL9Z
         XetT15kdwhR0lb57MzUM2IHydNc31mb/G/HKPVsANJqTGxzflOsanq9hr5zQdTWDY78z
         HAFga8HToQFBtlBVC9ODp+5PsIkfspMf+nGa74hINoY7ZzUe1YQv+IZG1cP1HaVX3WvB
         H/+A==
X-Forwarded-Encrypted: i=1; AKwUvBy3rNAuU62YJyaYHehi7RdyL3d5AJVQHdikxorzw/0PSHDxX6wvGyO9Qguv2Y/YK2TQvkhgt0btI8bj+ITO@vger.kernel.org
X-Gm-Message-State: AFq9FYJcT4E+qG6MHyKR0E6eKD1b1rjQtxJ3ygH1yR2J93V8iYEyT0S/
	Zi8LFk1HvFjlxRsJNOHm4SIkH9hG1zABEbqiBoWE6kjwSfzC9gakB6o9gTvILiBNlgMbBUImkm7
	MTD1dnP5Yd66ZznIMpmMWEoUziHNdGb6pAS4aZv6IfBV/4HWRyd+CiwHFCHPnFZr7XwOB
X-Gm-Gg: AYBFou1hva0EhAP7pfzKi7whRURFgayqKEVVB6egVHUXBLH+Y/Ee/FNRw8CezdSCyVR
	4YrU7WhEs0S1bTPJFg5UFn58hOoXKIAVHzp1l84Ocg1oBhaKLE2CWifDOmDlPiYfws8yp0HORYX
	9y58bPoTThB64k1UJ0UcXxseIu1BX6jMqbgO0mFXxa/KCEFf6+IdUXs0QjrZU9FedlBd+JOa/Nt
	uiFWh3VuyuMqSFrK4O/LLiLkmE4hHVqlIE3nvxRQE9rFMp8/0RPs1CB+pjuF42vzPwpof9Uz5xh
	W73wlJ8VFl92mP93HCQhAZOsFqdk8kmMzAT1mq4TuoxEevQRMKrZ3iiS95YRyV1EhSLyCZojQvC
	/2EVLLrkqWwHpPUd119O+zrvooB4ObQxRV3uGarTSvQ==
X-Received: by 2002:a05:701b:458d:b0:144:f089:b189 with SMTP id a92af1059eb24-18513f76427mr9319131c88.36.1792390078709;
        Sun, 18 Oct 2026 23:07:58 -0700 (PDT)
X-Received: by 2002:a05:701b:458d:b0:144:f089:b189 with SMTP id a92af1059eb24-18513f76427mr9319106c88.36.1792390078055;
        Sun, 18 Oct 2026 23:07:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm29051923c88.4.2026.10.18.23.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:07:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:07:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Dan Carpenter <error27@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM
 aux device IDs
Message-ID: <atWzt_cOCgEzFAyk@QCOM-aGQu4IUr3Y>
References: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
 <20261018192151.1115a40a@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018192151.1115a40a@jic23-hlaptop>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX2pIfAL3LHZsl
 DYOCEMe1Teaa8r/RHMLFBibboua5qJwrlTMwsEC79F5BkiNQpgbA37GA0AyK7y8PdbqsJo3vF4U
 GzF1ugrtb++faz84FlGPoytoyUYm+cLtqAOODC5p6+InwwjKYskUTdzrPpgtWtbWtWmanoFXPIf
 rFxRIq7kgId6WYcKS3ixDxAQ2yHriiHipggLNmmzDa2hx+626yHIUA1l5rMdHGwbgR2sl9ITLqv
 cpR9DPtgGf/f4/W6BRAqsf3TKUrr6eg0PjPYfI2Im6fRGcshi4uNvSuBAXSTnqU2M/l97v5NpjI
 KuXX0YgHjP2CgKYD/M+xk1gHZxOqyZcPtZmDTZM/5357uqxMjoW+HSprrAr9qgX5G06dzrvMQzh
 g/hFiEvKEkvO+wuZbcc1089J2Fx5+C6JwN/GUIQ5G+Sz3tMzVV3iQIKVtTx6RySYX4qoxMPDCtT
 eZFfWIk58ErgmX5+VRw==
X-Proofpoint-GUID: 8w14GIAqifi4HWbjpBdKtc0ZF6wcLcMV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX8SxLi0T88uci
 KPnmPGwshNJLVV77/Z1jx1hHlQWrzTuxBU49NQP00izymU+TuxsjgxFZj+961uhr3v3a7INbQmz
 hRVDM0orSUGXwk9HpdLRBwPrfBfSkVE=
X-Proofpoint-ORIG-GUID: 8w14GIAqifi4HWbjpBdKtc0ZF6wcLcMV
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad5b3bf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tvFe3K95HD5XBKzLawEA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190024

On Sun, Oct 18, 2026 at 07:21:51PM +0100, Jonathan Cameron wrote:
> On Thu,  8 Oct 2026 11:11:54 +0800
> Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
> 
> > adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> > every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> > to register the same device name. With ADC_TM channels on more than
> > one PMIC, the second instance to probe fails:
> > 
> >   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
> >   ...
> >   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
> >   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device
> > 
> > The ADC probe then fails as a whole, so that PMIC loses both its IIO
> > channels and its thermal zones. This shows up on Nord, which has
> > thermistor channels on two PMAU0102 PMICs.
> 
> Fixes tag?  Just replying to this thread is fine rather than sending
> a v2 just for that.

Replied to the patch with a hope that b4 will be able to pick up
the Fixes tag.

Thanks,
Shawn
