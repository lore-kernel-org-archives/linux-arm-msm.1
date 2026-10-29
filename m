Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269454;
	b=QqRljQS67Hrw39mPjNd8eJPmTPfNUOxkd0AUscXAiHIatFOUkZ7NsbxVk9eONe6XQ3q4
	 V0Xgfjeu6HvpFLuIPjizQAztPoP6ZMrYKmnVlrF5jteilZTshyxPsKpfrWmR/9v2cICdz
	 0oMsywh0NUrDzYH9iuOx24W0VRvU9VEBVss5eCk9Gk0hqgJod4xvCNxLjQQaM76hEmUAT
	 mbL36qtD79yr6WQdSfEkfeG2F4lDhzzI4CDzrivxTplF9iriQSjWNSYK0II6D9gnX+klK
	 4lgt5GWnGvwcIMlYUWxBWp2TR2q5T6exlaHAteflHvopuhGzu39v5roiLMLofHV4tPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
	b=Or9V0kamok3kOYAho8bPjh6SnQZWI78jIepgmCzDHSTQtfD/zB8KZ8fGE6oIVRB8LR4m
	 ofAVBpo6tj6Cke7dic2O6Qaft3Bw5h5w8jtMvicMdvygTUhBqR4PYIND7Xuq4qE89ekES
	 MBK8ey06sphcQuf3Sz3tgFAlSSw4KjJiz1iQDRKElxAqIlyQTw2GN85GjSRHzuNyd/SDW
	 uJ7USCAZFiAzsbln+e7yYdTbYS6ifF+TyOUaVrYio+iGxVcPLNxSiwwFImnYFFTD1Ow5N
	 8QKy04D3g7nUdArHO5kqf39k8ohm+1Wy7raJD0Dk4ViDDyQ+6pIJpURZnUEq2D/qVVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgziJLqa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9A606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B9A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPyC5VYU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgziJLqa
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TA3jPq3607118
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNrIEX2HLFZvWx0hb7/TeOZv
	8vO2qpCvpN+LqCQcSDk=; b=WPyC5VYUubHpQEMXJRE9GWJ4zuY3zgsVgzNb8E6s
	2QBuhmjbM/EwxQwjBIwlxBLTmcyjHDs0t0tj5gjrRlsZqze/e2zv9bBHjz5ShGR7
	76WiMTlgF9K+WCPlXMxch1M6wO2v9jJfHrMwsOOWR9x+8aZvX161iNZR0it5dGNS
	Kxizbnl6tsmkCpFawBuqr1OBezAsFhwELNfWSaSWdmIxTWUD2r+taCfqcJ6PZ6cM
	S1u5E56GL5O/2iEm80fPjTQvZu5bTCcf32sz7tT+cUfC2FrJNhHwmEOb8IGbqbBD
	kgjgO8ejkBGLLM4o3ixxeJIQ6vsYzt5h4W6eAuJPbwmkEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fg2c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so347030585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269452; x=1793874252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=ZgziJLqaAY6DHyANE4hvLejnsK0xeaSDJfOT4PALWPvLLhvGfoXmn+GKZ2cbM4zbOt
         5Uzg5OSAaFj9XCpBc5bUgc2plC7Jlv8MY7yk1eX1o1fOkp9HTnu/DhDwmnKS6pU97JlT
         q6el2t4YIo5mb1UfeaRn4xH09QBCYHE4JzhbSJ4iGM7b239ldTzxKaMZHz9vcHwHRgLT
         nDiqfH6VW65vytZa6mo088SlNt+UPBbVvZf7h9Oh1R1r5oVfAtkIBcIbqWfVppAKPNaM
         6Vrz9GodQIBH0YdnTeL1yTr4kFlXub0A0+tkz1ypjCJ9utV+6j+l03CaohOA68XZDDVw
         vK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269452; x=1793874252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNrIEX2HLFZvWx0hb7/TeOZv8vO2qpCvpN+LqCQcSDk=;
        b=aGcGdOO28Et5uPz9iP3o3fVG0wovnOzLkxCB1nqTdr6RMY+EA64jj+TujiOcTMZsJi
         1sqGEaysrzjsWRP/CXj5Y5+jLHwEMCszT3FG9pkh09ipOGJmc0rxTA+h/wtR18nFwqmk
         7cEjRdQke2g/i+N2xRcZEhO4hN+UUq14gHHpsW2t4Sk/zBvqOHT77ssPNH7eGzn31Ahk
         /G1Ru0zQeEDmmB8ybYJhL6offKWqrAbixSiP2ar1JFFKrCurPDwhUiSg0XKR/3eDdIQU
         KkjGDZXVteXYIlSmIOwvJVMoGaU8stbRNpewCIKNmh0VPy1J6oXPPI/BpWyHjsOe+bTq
         F5kg==
X-Forwarded-Encrypted: i=1; AKwUvByBvx38PNFwqCtJvIQdn69uWQ6faG3MmAfy7IKFE1mBSM45NgiPVmepQ7f6OLkYee8JHPlz6Pur21eEqCXZ@vger.kernel.org
X-Gm-Message-State: AFq9FYICdrrLeaBCxd4oicz2NQEkIl2jLge/MOHCHA96uh+XHk0wOhxW
	bXZ0uWjKiUNcL5q6T0hY5VEqiEQw5d9bOh8RqtvUSRD5i/LtX3bbgFGgUewggwPHplA6N5qTKw+
	mMHeHKWqEL4MJdAXe4dM6MSnbJC3k1/RI8mQrwp0h14SUpRA89Xis1SE9wy2RsyJFxrIC
X-Gm-Gg: AYBFou03MdM2PtgJIFML5rsRUNmEWliOGHPmbJcun6VZjN2M2DraCWweEd+pTLFgHMm
	0ddtw+cROEg93hXOYRI1gtBQTIjWA67a0WCx6neCaSRz2qhJjBUygZ50FneDbb1fpHymHyGR6M3
	FbCwXmxCYe6JtibW9UzF85mdPUy4K4V4amJlGYSpmP3poWPs2141gmvqPtR09NTqml2lxmAcUyp
	c6N1pty5oGIe8PtFKBcwwoif3CT5hZKPSsfJmiYRjr3nG3pTjTxElD4/pQmAihVNEZe9TmbMNoC
	87jjOWA6MeB8DxXkY6Zd0UlOGg4ODS7QnLnEAwiHN/UYENJs3k0lTM4o4xjTkYJG6sqvI/QxMKV
	co+nbOQ3YXPxJ3+wgROBYPIH3DOc1hL+IoTwkX44xiOkoOYc5+wvxtqcE7ksydIhu
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766985985a.15.1793269452287;
        Thu, 29 Oct 2026 03:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:93e:fc4e:c490 with SMTP id af79cd13be357-94408a6ab94mr766979685a.15.1793269451464;
        Thu, 29 Oct 2026 03:24:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm33789347f8f.25.2026.10.29.03.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:10 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Message-ID: <f7rue5rri4gyfs3ltczakyonvejyubjbocwabpffez4wnjolf7@b2hnrwwp6mil>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
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
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-9-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX03dBVgcOmge0
 S4rsp1/XN+tfmeKKKhTGZflwE233Tb5oMRtSd+7EjU2C5s2MyYpEIg8p4nNHXUAX2zT+/zfMrwN
 WSR8nE6CzO+bQVaAKtPPrBNoMY7TyThgp16YW4tqO6qmCuPlKmzKnKpbp9fAgUX02KIX/TMmRWe
 zD44d76XljWz0zF9c5LQsTgx7FCM3kpUBv3hWMpjsfevDj6+wOLMF5c/XvBMKK+Pll6asfX8kdx
 TrPsQdTPeCeUjAktgqyVxfAUqo1hpPdEf09HiYsfEvN2/R+FqNotyGnKFQ1ldf2B8yv+R5iznLR
 72udLq9G20fhBo6VEGDVlX+SaK8sCfSXZmZUBDQVbKBog3EiIe8/XX9rUu6O4ezAKkO3Uc+Ui0X
 z2m2zVDDQ4YZtL1Pt7f7Uzb8R1PQkBw1qdgIE0jLhi7QNFGn+a01/ygpBS2IieEJ4WAgrhgslxj
 9XB3WlF2TxICI4RdDnA==
X-Proofpoint-GUID: o-V166JUsHeyej4YIKVOLUY1VNzN5SPM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfX8LnJv11qo/kN
 D3Q4ajAZLwTzgmU0XJBMjid0YHk3g4P6PT6w0n3uT4l8cMyA6/+1Ap9U97FVe4kfyTckTXhwAoY
 kqcoXVz3E7H02wXzcG6SXuwRwiOG1Lc=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae31ecd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DZmtaFOGBJufDib-chMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: o-V166JUsHeyej4YIKVOLUY1VNzN5SPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040

On 26-10-29 14:31:03, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
> 
> Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
