Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401930;
	b=PKDcouKmh/tCO8tZhsVYyzHtQG1NLTEiLekqDoz6dIRI+nb2vVVrsCOFSj7EOuQ35aJc
	 loGD6Kc636TxuFIuW9J9PuWE5yYqL2yjcpk7A/CQ9cFN4gRECXjuZz4l+UF6rtcBQzuow
	 2U5yuPWA8G8S3IeVokUbq6XlUo3QtrgZoLy8gZ2i+qRNULjE2oo+XP6QvTQKtpVVUK14r
	 EJOO9FCMoi9Z24imVNb1Y78+ALcWYxMkDVWBKcVW86YwXKVG4B26VwRbU1okpSf4vJLnK
	 BO0yTqm7GhhfLBMaAaH9aM/4a1iYNVG4TEo1eyE5gF4YFHJXLy6FXnQc7cmqls9b/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xLuwRiDMsAgYyoDLM1JuNXv6FhFKAvRWcgh5bebshE8=;
	b=10lmea/OiB5bu/6/MQMCBrsAhUfrjDEPfa8oITrYH6MZarBbgRh/SwGpVQBTKlGLUYox
	 BghdWT8HerB555GQ3StgXc5ki7l1rxDve+cFarxtJnj06ud+O8z4LkerCKbidq9Z/yoVV
	 VOakd2SyPNHjMRWSN6rmfrbU6yukORJsjPuXwH0Br1ncQ2p3zt5dS45XAbKVZVs9Jql6T
	 AwqC7my8T4YPvqUzPZa+fNWY9+RZ6VpgKVolAtV9k9o7g9ViHfy/nQ0aD8QXlsqAUOiDg
	 ftPhdw6prN5G0dwsg/L2kGaHetQsaD+jLVpxacNnT9IOFo6NW2idM0tdcZ+6+Kse1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJrFFQ0r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAbwPQFu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EAA606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37EAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJrFFQ0r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAbwPQFu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ3XS2001472
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xLuwRiDMsAgYyoDLM1JuNXv6
	FhFKAvRWcgh5bebshE8=; b=TJrFFQ0rSub7muCL5DHGXg9hQAqY4VHCh/w3+oHn
	Aeww2uX7KmlCGB1nnekypgagvRYMyQa/TIb25yLmQHoy5O4/7qallKntHxPNePHp
	y80yCV8DajbK6/oBH0nBeXR3N1L+afIat5KTdxW9CxFQlC+wL7IU5paAfZsHaqGm
	g3o7mksvGykhk22NrDRcLSf90T3iu0j2HgU6im8E99NNIlckDhtT9gSCYELJPuHa
	9uXonTX1E2HrO3GQn8p4eBU/Him7YIjL3C2AUKmk+iJkXUPcNeNEu3+QkGp5I5U5
	0UCw6APYF4eKeak+xj3RRB4cVV2/xR+5xo/wfdu+8ZDyiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2pj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:58:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so175057385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401928; x=1795006728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLuwRiDMsAgYyoDLM1JuNXv6FhFKAvRWcgh5bebshE8=;
        b=FAbwPQFu8ocKzaS7uSEx5kV+p1EUDxjlkPnzoGVhiEvJxfEI3v70Fg7TEeEgA83anj
         bJp7s9FhdirEdELYXVokfE98WQL8FGTR7EFpkBNBACJXMeSIDB70VOkJlZPU4jccyGsc
         cogEBHUhIqqzSmMVX3+iucvEj4aw38sCqwoHJVL5gZwOQPF2kb7MCl/h9KAEu/tYbtPi
         AYFb+IRSqqVxgoLsl9s0d4GlMqrdVvqHmjS7bQJu7vMbrQ2ClnzmZ0ICG4IAYc/ndGPP
         e+bEIreEuG8vbMkwBYcvpEOdSlOu2l0HPvsn5XJH7n2ZFQBZa0oOg2Lcy6k8KwnoVS57
         RLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401928; x=1795006728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLuwRiDMsAgYyoDLM1JuNXv6FhFKAvRWcgh5bebshE8=;
        b=IVLoQcadbmiM03QSM4XCd8FBkNogZlIQtqVdndrlPY/nHRGePk4ZK2uoQaQkxF5sOP
         6LVS9mp72AlhdH3p/Na+5zInohJSYUiKz2xmsDGaKl8HHOcVmDcJfHjfRwTEMhzZhqgV
         voWXTbVJoscWXW4LnL4Kcb9Sg5U7i+IRdkpXglm5tuuSQeNqtOHRgKJxqG01FRjARAZx
         9DnZ0leq4XLUNbNZdxJSY7Wln1bWTqD7eb8Fi0WTDHo1xqv+oIblL9sJfNvtzFmvAAD6
         Yr5d9kHkTz7P4t46AQINfY9xgOChxgB6nNRVCyb/P2eWdJ9uxu31MImlkGNhkExRmlN5
         i5Ew==
X-Forwarded-Encrypted: i=1; AL+hErFR8IlTrMx/IZ2jI0ZjIMawEeqtyLL9zypfjQeX8v0JevEYUFnrWWWr2dL3ICnRngJL0GG8sdRi+Z2uFrk/@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xgwb11VlCYCL67XTFcKpl+JWzDwho8/gvK+TFn+mBo57hMzbD
	ARUlco7HEQP8pcCOIz9bQplYIrCj2hRP4AHuSlstLeCcx6CsWtlS0NSdwxY71T3dPhACZbBHAuM
	1UpcogIxOiBvcgiCC5Ukn7ubh0DRNn7hAogvOkas4IMfwx+hQG21YJSsVvbop/QQRFs6Wdlmmk9
	u8
X-Gm-Gg: AYBFou06oy0VilYJ0c+ZJnTCAoeAw+XsUxwcp8UCIUEpH847nUoE6Qp3nczBYcLSnyL
	U/7NSKIAISJZqHRBBVV0tdaL4woiRMFSNsTGrsjhjxbi5tF1V3mfldc0I3esRhEA2UBGdttfH54
	JSKzqTo/g/ti+WHbdUw7w5qaJvzzu9aX78F7qTqD2MuIYYdt061o5/I2v0V+qWZ9u9r0mEsoxsy
	w8cHTNCOCUR/3NFCme3IREKjY63+wOnept9Xli/MXpRIQDiKEGj2kt5/jBl7/+1PMrWa3Unhbna
	voUzRY7ydS9ZhyylgosMm8hZuXXRIXM0Cl6K76I7cbyBQQ1VsfaXF+8KNz39YD/sHBBam+30cJm
	5OPlc+SGRuxntic5qPalUA9BlNrWHwFrtkETnJeMijr1zxJIaLARV118YPz+89+2H8hjfidvO2a
	T6rtPLo1V4T61IIQZxNBVsPtRo6tysxn8F4zA1PXa71aZYB8o4Tk3myiPJELRw5g==
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr328476085a.59.1794401927997;
        Wed, 11 Nov 2026 04:58:47 -0800 (PST)
X-Received: by 2002:a05:620a:1b94:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-947b00082bfmr328474685a.59.1794401927556;
        Wed, 11 Nov 2026 04:58:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c160a78abbsm251946e87.43.2026.11.11.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:58:46 -0800 (PST)
Date: Wed, 11 Nov 2026 14:58:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: c630: Wait for the touchpad at
 resume
Message-ID: <vrdpknallpy43dxgkkudqokq2cykm3ryfebpf2oesyfbs53k45@jx6hp7mglchv>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-14-ardb+git@google.com>
 <77983ae3-f4ae-4b52-903d-d5341ac0e869@app.fastmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77983ae3-f4ae-4b52-903d-d5341ac0e869@app.fastmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX/v5lpeN9U4NH
 60mxgCP7Kn9GZi9EeKXQNMOqVSBZvys7mG3OsUDJe5sJYwEsWbGuArfX4yQqGyJE8NnQhkPlKoQ
 sVz+If18k3y6xbHF9c5BAV5Ti1bAyXs=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af46688 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=Pd4HU63dYYUIdYn22FoA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uFFyxeUlM52UJ5sGJKnbfFSThE1ZDAd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX1dYdT3ls/Cal
 VVaV2M8/nfena5TPJlidqoodUDE1XvKmX7htM4p2PUNkFlIa+nCQ6O+vW1sl4R9Hr1iSZ0jhO25
 P5i+ivSXnci8lvp/GX7gtEqMM+Tmj3tZpfcqeptON2X2+94ZYVX3HDwQRhiu7OR/DPW5WM5MjSn
 3Vg/bbIpwSbSVRRn15xEHrjcNhs5HXHGnGoRqDZDHCJ9UNKBUaZWTNtK6m2moLiHJ0VftH1B4MN
 G69C17iCN4X/1TFvtS3tHJY1hFMFy9S7gi/Uc0hEMxV2t3VJmZugOHCIRJxXkO9J4Xxfsmrm0HQ
 79yKKMkRWWzUO0SZCAsnHlf0lV87Ar6U6/8aYefahJSmXM61LKmpPeI1QGzNyg2WHu2x52tbgs0
 lTSWZ1CXbMYR8PG3XTSwYKreLBfo18hqKBBkdz28gF+FNpqtA7lydLt7x3b7hzCyEEojqvBahuf
 w5qCuP7Ta0GP0+1ooDA==
X-Proofpoint-ORIG-GUID: uFFyxeUlM52UJ5sGJKnbfFSThE1ZDAd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110051

On Wed, Nov 11, 2026 at 01:22:35PM +0100, Ard Biesheuvel wrote:
> 
> 
> On Wed, 11 Nov 2026, at 12:53, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > When the SoC reaches deep sleep (AOSS sleep and CX collapse) in suspend
> > to idle, the touchpad is often reset, presumably because it loses power,
> > and it may still be starting up when it is powered on again at resume.
> > If it doesn't acknowledge the power on command, i2c-hid tries once more
> > 0.5 ms later, and then fails the resume:
> >
> >   [  712.566907] i2c_hid_of 3-0015: failed to change power setting.
> >   [  712.567528] i2c_hid_of 3-0015: PM: dpm_run_callback(): 
> > i2c_hid_core_pm_resume [i2c_hid] returns -6
> >
> > hid-multitouch then never puts the touchpad back into touchpad mode, so
> > it stays in the mouse mode it starts up in, without two-finger
> > scrolling, until the next suspend and resume.
> >
> > This happened after about one in eight suspends. With a debug patch that
> > keeps trying, the touchpad answered the next attempt, about 6 ms later,
> > each time it had missed the first two.
> >
> > So give the touchpad a post power on delay of 20 ms, which i2c-hid-of
> > waits for at probe, and at every resume before powering the touchpad on,
> > as the touchpad isn't a wakeup source.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> 
> Please disregard this one - it doesn't help in the end.

Are there any additional power supplies that might need to be enabled?

-- 
With best wishes
Dmitry
