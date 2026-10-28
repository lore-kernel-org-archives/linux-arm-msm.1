Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179513;
	b=ycjgEa0DnimVpUv+sWAnLAXduVkKR388kHKJBTUeH4xUfcYggpGU6N0BMcxmGt9S3Zhe
	 IzQQ8RjqNYvR96LFYLIrwRKM1Dl5w7vQwT2DiOw+AQC5hrQiAq/KHSekOHHwU+IP5ZRMX
	 BunOCi5LNyeqFI3mGRW1ZmLTIZxKuO0dhpwXvYN2tdXlr+4xO8cuJYwn9eJcdz49YEEog
	 5mvsOEIaIHlCSGyk5xaqfRsyGYjhTTEQbn4apOGxm0Zp/dlK9ipiskXYQrAgR2bUJDvrs
	 IzqkPJMFFMrI+ixURkOnLWB4BM+ZR7QaqLz/NbN96HkhXdwF+fsWXpgiLlOmSrUUhyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=;
	b=j8CtVZiNEvIGLlCzXqMVdpqpB/FKReOIUYLO8FrM6dCiJ8PgahEdW8fNL7lpxc3+Kf7k
	 UovTXeIT8fPjv382bv3vJk+hVHNYZnFkL3tLR/c4eIe5k9hEPmYTGTAhC4gSGypLTDM8B
	 gIqyQtsn4i2d0KFIx+TbDgd1g1dbYFDSMByH5WsHFludyW11l71JnabwgLqe2yxYQCOMJ
	 0QqqGXqG71l9fJ3iEDfn5Fm6vlIe69ZWMy8LA8QHz00PYyXbjk5rdOMD8nLNSnjLJe9wc
	 zZKNWyq46rDOEy0ZSIpXf/NqXn7DuatuaZMR9tHCaggqFFNr5t4nqRmVD7hGKRFjWIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HtxcpXB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxJOY0J3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99556606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99556606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtxcpXB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxJOY0J3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KAlt066164
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=; b=HtxcpXB/qEuNxXAh
	t6AtZymXEhq/oIxoneT4AnQhSEjqzJ22A46Dc+e9bAS8iuhbhR56XKtHLh9+VPGm
	KFux3upeU116k7rIZtCWnp5L4m4T5RXkJsGFm4T9uGsfcRFNJjmZLOMCv8huhVmo
	xTtOzDNYxIf93WHiM1xF+L6xJTa2GI040EVhW2yddZZJ2+/6tAEgxfnTJscgbHXe
	LiKX2KZqIAll0HDii9ZwnelYD3Sst8kN3YdH2IGFNIpye6OHS4P8jZuuotj9vAuh
	SNkC4oup6NJWLpYPhx4iNVi1ppFXOxaT1VhXD7Wf0dtF1zMZuoB5fxHmZYkiWjH2
	fIz2nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g3e13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:25:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so66188185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793179511; x=1793784311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=;
        b=MxJOY0J3OqMNkLC1KxCj5oRaN4hl9/6Av1RsmlKapqdTrAW8Nzn+oQuMyCIRE2JMto
         AFD3Mjm+pC37vXpMwVwlTQks9IjP47IbQCFWrt8Kln/7iypyeZhJbnNy8lOoDeTWT4OS
         V37ophdbDcbfovqPVnfx1nrucsR6unHJClbq30CPgsQyjpMw2q2N8F0VfbdjumOIdwW6
         KQwpk8JS8vW1xj69NqjwRT32J3ulvQ8Q3BvKDVV7+WRllJM1jqGBSPkDo0XXD9U6gzaf
         Q9ARHHkvLsudUOWmc73UbQnzwwa16nygMZJvlgT7fkl8EXgeO2AM0ZWGfjK9ZRTb5ieS
         XqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179511; x=1793784311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62VMoYXkfPS5QzKDj53WWofwoLriBF1+o0OrOqpo+0o=;
        b=m3DFuI3D7RUhosG3j+Jgj2sdHyF2ktwxVoAfoKsHBJA7mqvkdGZlf35fiS/oft+1cP
         Tr8tKGzXa/0+GTZMgoeUmH06kzqHGTkPuZowwLIQf50WE36JwFAub+u9dc2liW0T/yWr
         l3R1KAsfFErO1R94AtCw2rFl0vDf0NP5M43RwIhKG1fWKtg5tczkpQRSK7JCDghbGzbr
         LIArRwGOrbY41mOQYfp59Il7hYRLt3AAZeTEQUiPDUqzTlFwlfcxgJafMP7w3Hl6dTwj
         eA57Vp1LQT39KZm6bo+Ory4bewqQwkadBgBG7vBFxC77LSU/5QbZDYHBaAKvZlOKXC+1
         PMNA==
X-Forwarded-Encrypted: i=1; AKwUvBz3BZiWYfUqNeccsi5bdXX8sNCXW0FCtrvMyk490iPyV7+QwhRHLxPpLb98/SYCAC3UvZnUMv4ukmICK9La@vger.kernel.org
X-Gm-Message-State: AFq9FYLfdQzcNdBym5//bFvbLaqfIJhuBSKaipPGCSMI24JfJvxRUtit
	fiJXnB9CIiUaT9K2fZgUtW7Wzud7P319pOaHGdN2la3yXfNMOADgvFo4sHrgYvip6lJfqsQAwkS
	L83RZ2O1qph6bcpxVt/HVsl0pCnIk0yJLXzEjB/pyjFgn4c1d3gumvBea/g7jOn6H2j0Q
X-Gm-Gg: AYBFou1YY/NfzwDuYGFHNvYERd6Ex32LwH4YzhMOaLVXxz/m6/0ds6hV85lzHJJalUr
	eeURjbetVx+5Vk0L1H9jt9pdasf7lwSrak0Qv+0vaBvKYRYN4vh/HLCK7mZZBuV/vt3+efowfUA
	M7hI017+EcgN1PccdX3blf+GEG1KEyESNpuWvb7usLOg4DActiOrVeGjTYyPzDmdptv6yLmfSqh
	YowcppO+X2rlCeWoiRz1REf4kAx76qnIloYzQwwU33/+L5DdBjEU5oabl8F3gsAa+C72hgnycsL
	LJy9vQ4PhmUCq5QuAA6wovHhEY4FWFpV6IPIfGnEdLiBKguW/nX/bWSM2kKCef+8MwrrMbpvmYG
	5NoT15qI6t1a2czlVcFaPBoEnRRp90Dd4GRa1wd8IImlf1gbxTI7NxvXiMqLtqXgdrIw67O2gbq
	At
X-Received: by 2002:a05:620a:26a0:b0:939:b8d6:9b1c with SMTP id af79cd13be357-94408a72eb2mr214269185a.19.1793179510745;
        Wed, 28 Oct 2026 02:25:10 -0700 (PDT)
X-Received: by 2002:a05:620a:26a0:b0:939:b8d6:9b1c with SMTP id af79cd13be357-94408a72eb2mr214266885a.19.1793179510221;
        Wed, 28 Oct 2026 02:25:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm19434555e9.2.2026.10.28.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:25:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Birk Skyum <birk.skyum@pm.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: Restore the pin configuration after hibernation
Date: Wed, 28 Oct 2026 10:25:07 +0100
Message-ID: <179317950511.9885.396157708908521949.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021210425.57066-1-birk.skyum@pm.me>
References: <20261021210425.57066-1-birk.skyum@pm.me>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX3jEdhZWZwV5v
 BSlkEiCYxxmgYKoNwbsHGOmm1mDfeW825B3T90P1lnfCuAqcXG36uB5IsE7H51EzQWvbde0XFdK
 BUVDQo0X6ytchdPDoz14SmW8Ds90xBWrHAE17wSc9VYadK/yB/toZ+S+tCL+F6BV8jXg1D/rj4z
 OfsYT2EuGzGy5iVK/DdjXra6zDsrsy0Erj0hnwy7MaOKk9inZdCeVVnODEGLsS93Dt9FvhY2h3u
 WKQbPll4bnIQGMkGepjow+5PTS/G3QiixjMMpX0dgAkVu5+gmv8epN2IWIdJMW1Pvk9ItnXcUqj
 YgUzZptyDsLgvvO5Fwx6TE8IOigYttxVHqupAoDmMoZcCHO4SpI2ZzJfvE1PLRkHucknAHIFw3Q
 GpXlj2+5E5Vkv39N2O2Zsvet29RUSbxYTxT/0osp/lsm1XJ9Vv9UjESo7aTWsiIXvcMVgWowhvt
 XLCW+Wv1CocXz6zbhMw==
X-Proofpoint-GUID: xycCk8aHouqqGFJXPCqDY8OyubAs9nX_
X-Proofpoint-ORIG-GUID: xycCk8aHouqqGFJXPCqDY8OyubAs9nX_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNyBTYWx0ZWRfX6dVL5siUowRQ
 dGakBDjc94JulAW5dEb9NvWWC2hHq1QFxI4+N9G/hc8PPlMGxh/y0+AlRd1EeoKUl4nSy/5L1AF
 gr/fbvRVQsYtjLpSapxDt9QjnVQH+BU=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1bf77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=B8HrD5q8qNSOtOt7yzUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280037


On Wed, 21 Oct 2026 21:04:35 +0000, Birk Skyum wrote:
> A hibernation image is restored after a power cycle. The TLMM registers
> then hold what the boot firmware and the kernel that loaded the image
> made of them. The restored kernel has the configuration it applied in
> memory only, and nothing writes it to the hardware again, so every pin
> that the loading kernel did not set up the same way stays wrong.
> 
> On a Lenovo Yoga Slim 7x (X1E80100) the Bluetooth and Wi-Fi enable lines
> are two of them. Their drivers are loaded from the root file system, so
> the kernel that loads the image never touches the pins. This is
> /sys/kernel/debug/gpio before the hibernation and after the resume:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: Restore the pin configuration after hibernation
      https://git.kernel.org/brgl/c/30d9a180c86e3cbd53efb7152e05cb059112f6eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
