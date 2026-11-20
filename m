Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203316;
	b=46e7cGfz8BgyemDmgP2NTEZ6StqYDtLrgFrolYc9Gz+CZyE7E5BXvTQn5nhyfuDq206H
	 qSzkkIj9WXvljtDTa763qGe5Tl9l4dv6dq/KssmxZGvugRH8+qC+nVeAd9W3et4fH9eKA
	 l5wxzpfFnn8dRw0k/TCVIFdfmpePWqQZaBwL6K70ig7QFnJkaKae3H6/jcEXi2/uwHra/
	 +MA1LL0LKgRaV9WGrVcHcrDlREMx4eJnAWpZu9z8n2CnshnMTyNid3dTSRKnL/8K5EAiM
	 uhxEDjCmia0865bdSq8cbj1HgRl3lP7bfZpO1kej9Xlbj2bw7qFvBmrcpWJRSvJBUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NikyEkn2Ckik4aNGE7wLG28YXcgo+vx8KHG7eWoRnWE=;
	b=hCMFH+b5CPqK1dPPLJF4cz1F0BUo0xKSWMcgUJREVpwsnwF9hJ0/Tda0CsBAyZl/jkHS
	 v8sfl3iyd1C5TVSbqPmoKpYXMZ4e9sw3/Wcnb9JITtsSK5M9GDleZ90Upiv7dMkASCy8w
	 0gcJDPJ/6pcrSxto1OHtSa9pbi7K6t0Z6jS2cY5hvdIlTbYNBhxe3txtUGLuQiwikHqf+
	 5mzgQ99QQezZg7ZMyO1lZKu6K6mjTC2ztTRglZQwjnMW52tRgOf4moyPGcbub75kTJiRM
	 0jed+qJSQUfzu4nMYujoklA4ioghJz+xS427JwZex9LdaiQEYTJmqxneUSno8xldkBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdC+1SgU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3p6Q4W3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB760A260E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BB760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdC+1SgU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3p6Q4W3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFs7R3830196
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NikyEkn2Ckik4aNGE7wLG2
	8YXcgo+vx8KHG7eWoRnWE=; b=fdC+1SgUVo3ZJ+Q9pVZdg1/C+ZwBMDFDwT6pZb
	lc5EsU0ViuA7M40Y5na4t1ukO//FmM+6OnTyTiytcwDPHGNyjSgkb1/vJcmrs/Vy
	212Xcc8hKD8urVrro6/GoX83lhOJ5GNb8ShOVuwbsnzb/J7twrt+GyYyEUspZCxv
	SZrtayV93C+mCxvZ25lXwl/QYz7slip/qWiIEYymXHxqPshtRJSRj/kfwDBiuMRN
	yxG5Nwj1NpVDzY0Jb4rNU5HeCWKq1PmultyunQpHunTk6O6f57VZaYyXxL7Q0UUr
	FhDM+a5LHsa2UFOdG+fkNWg7ARNKM2aMX/Py1CrYdd74p7+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwgw85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so267805685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203305; x=1795808105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NikyEkn2Ckik4aNGE7wLG28YXcgo+vx8KHG7eWoRnWE=;
        b=Y3p6Q4W3g+DyNDpyNs4wONLlTJRBNa7RfhPAbO+CHjae72YZJVsu0+eNYqC8F+h2+q
         wkfDW5rrVeAL3ykgy5pDZ6t5qz7AgPbjLtUR4daXW8qaINjnJ8FJ89m1vRV5AqwKHOPw
         Wv8sPpf9/uQzfib/sLXdaUd18FoVNXYR/l1gtgxMAu6Yzcp6jjHNDziIr+zWu1RsLfxX
         xGEF7N7i2qNCKN6nWJapoDCmCDCvqezEOBJgl47Cl4KjUOuN7FLMKupQBxYOLDFL9e++
         YkeGnwv3fjvVP4LvUXJFSJoiHzpjW0Y1hEeGrvhddnQzAW74bJnnocni6PnSy/ucB8fa
         sDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203305; x=1795808105;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NikyEkn2Ckik4aNGE7wLG28YXcgo+vx8KHG7eWoRnWE=;
        b=T0GGH7y2DN1BbPufuJcpR/2PTpkPEgb41LO9AnDv6atOm9UY6r9X0iO5CFUwqLUIjl
         d8mcWwWiKP2kHyTy81f9ZG3GH4YkOmc1tEFtLlUCgwY8t8x1AP41FK3MNApYK8E7mtjn
         vFLrKrnsPvgh5k1nT5C5LlFkkTaFSg0D/AGC/tygDTemAkH6r952tSzVtj/YbVJF4JrR
         ezE4HPSg5THvDtLrFi3KKpk0l2LOmq4+mScKZUpTtnP4ocDNiB4dW6X/1aAk9OB9hXBg
         JbikTURvF6qxt1OLNw1949KPfUN/sC4+0Cw62DKAO7OZP/9H6uKVEB5Q2FMyI7ivpZE4
         RB2Q==
X-Forwarded-Encrypted: i=1; AL+hErEE8rfl9vwpLrbvrdVtQ/HgZI7BRwbidJjYB7WL+mIEL+MnhigsL32uJ8c0MyVsgdfWdpOHD5veg+rSc9BB@vger.kernel.org
X-Gm-Message-State: APuU4Z8oJDz4hjKTNkhoTTALS5FK0QcsHBWhEIi3RBaUGqlSzlbsyv0U
	SFqrc/6vNmflUG6XX6ZCmP/k3mrH8sry1wfN1wXx7Kcomn37xEiQHLhXsWNpKy39+fE6IqkWSh+
	hmurhf7TKPUJaAatC623jwCJNnCpvnkUMt3vcoItsr/iSDmU896ZD06SMZY9yC8SlfuyK
X-Gm-Gg: AYBFou1UNEelthjXi88/yC8ymMQD7RmPHAZGiswWGHC7qZwRcEUhLPNVuF7jHJJbLks
	Q8qnpKxhiZtvrNNfmrJr7nwvIX6GyYrd4yaqBtxna8OLLoztHCRnhoSp8YT8DUYyImwwLU5Es+n
	5EojAMG1wdugpaN4UGLFHCwuFgtKYutCN5WGmaV5Kwk06TM1b+FILM4CJYSVQIF1UiqHnZL5Tk6
	af1tUH1mnGWwAu/Vj3YyYCJo3/a3rKEMCwVY3bgXrkAs4xv7j+vOXfvoovF1AMpGXXCAoKRcWPv
	Bf02RcBTAr0nR18FhLaC9bY0LKG6kDRcDWY00WNrFQ9LVZvDjN1Rh8tHDzA19QEfcM8169nW43P
	DN00iu/PRjW0WqqRLO4u+YDbVC37G+I0vFtbb4lhEbn7OcXI8CgugdDPhIbPFmGDkCcYb9IrV/h
	O3
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr720707885a.3.1795203304769;
        Fri, 20 Nov 2026 11:35:04 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr720704185a.3.1795203304333;
        Fri, 20 Nov 2026 11:35:04 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v12 0/4] crypto: qce - Split the crypto driver into core
 and crypto parts
Date: Fri, 20 Nov 2026 20:34:53 +0100
Message-Id: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2gAGsC/3XTS27CMBAG4KugrGvkmfjZVe9RdWHscYkEpMQQt
 ULcvQN9kIW9iWQr/jJ/xnPpCk0Dle55dekmmocyjAdeAD6turgNh3cSQ+KNDiUaaUCKYySRh09
 RaJfFicqpCOUx54SUvdYdH/yYiN+4q69vvN4O5TROX/ePzHjb/eN0jZtRSJGiB8gQQlL4MpayP
 p7DLo77/Zof3U2d+6Vkq1LPEsWIG5UoxZwaklpIiFVJsaSy46DBgommIemHZKWpSpolZ7IykDM
 49A3JLKRGOnOrSWtrdSadTWxI9iH5egNny1JMm4QWXMigGpJbSAhVybEE0ureOuODbfXOL6X6H
 /csbfgCWIVkfcgNCeQ/BRL6KsWppdDcNwy9C1q38gE8LIB6WQC3upwJRhNZjlqxrj9DMNHxzBN
 1+p2E6/UbvvMQ628DAAA=
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KTZtNkn180IMQ7q/xXo9jGDg6f/6/gZiWsnPOSwb7LE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDkMgMOx/M1Q/T0IUCPzD0uz4f0ZMpVr5AxB
 1pzKZIRf8OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5AAKCRAFnS7L/zaE
 w4M5D/4tEZWCpTfdDXReKGXBm48pn5Ho8i6GNuJFo2iU7XqMGO4KV2//FkufCsjxUhXUmZKKlvd
 d+/vzPdf/ft6Sye+tB2sniYIw61iqBy8bYw5lcAx2LAKkW3Pm0Elz5OP6rkEmNUrMtGdyxlQWMm
 kPXj+DHjQFTvz4EBxrUMO8iIkHEjvxvqn+STZpFNJpUCctKJXH34bu4bc/teVZA/7Ym0YbWsBLT
 lVikm7n4fObeDlXhNS8tj/9h5mspdsTNeJubk+Sn083IB0uSNRDRuLmS7yxdLHEP4TC9rP5p3Bq
 AyyEviT7TuXJC1vpv2mkEDwQvh2949kSfJl5NWgyzwhsYDKYn5u73akLTZHKPOKIO7hbBAswgKf
 HQ04E5Z32e3XzKSHb1wEzB/W2tdys7oN9SsIt4GYjNfuhB70M5jpno8NHfPOY7EV0/YHQukhePN
 rKCmON+gw6EODEI+xcJobaeJCmtjgfRmquB024Shw+41GnN91gfPpRCyxs1zYRVQE0pCtCQJ5S7
 KvWIL4ubH6nEfW3ts6Knc54CtvvbI4Atf49f+mCO8+E6DUS7aH3qaZFf03Z0Midn/852eKKJvF8
 95EjGRmbIrUKa0JucqPC/UipJ+bhkSZ2omWTzJ4pDUtDv3U18IjYmUDAAbcm+vVt3nnAEi/FkB+
 /wV5ISl6fnN45Zw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: LntDD6-NJQiyotQT-m2DvBpQJrvAAckw
X-Proofpoint-GUID: LntDD6-NJQiyotQT-m2DvBpQJrvAAckw
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00a0e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=wzu_yjjtnJo_jeqIb-EA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXy36xcW8rvFFd
 vJx4ANGukrmohLtimZwRyEGKai/JKWv3gTWX3Kgi39ZswrRZ1rt9e0sBZ4qR4WhuOaqPUuFv403
 NfpO/IVz6iAtnyelVD+vpxBeFCfBF3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX0W6mJplrN9+A
 zUI1Z4bTHk7XufN492zZH5rSduE2hSUoHO+6ZMHUx3ASST9tq0Gq0PZrLpjbexyJ/KnTPbblVLA
 SJSkp7qZBtB1TFA5iHnkfIYSfwIY2TNrFnDpqJ5E5wp9KVK0tjhX7MNiXMCJzqHtBGt1o2u2mPh
 BU7wsLE6JoGSi1bnx3Oba2u3sPVPNP5v8xh2rVGVzAZQOk7uvh9j6WbLP2jGcd/iLs8ecGv5lC0
 gU4l1eD4Pgorxn/LtvTt/JLwHbSe4lHrQEdtgkwCefvecDdR0PQYtzueEqcMyozK8o05vHEocP+
 1jymreB0rB5mlD/w2u3EXrIozZy9Sk/9qJPctQ7x6WjlenjAGQtY4r1BoUIYneTtulz+FqGU0GF
 9pG/SOOoTxLvRddQclkoAChzPEqPsomdiGRtxzB6XGd6dxaI4iOgZ2GCwX5mjA7PKblDm952UWD
 rmNjpDtkPjYc2j9ZxEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

With the self-tests fixes queued, we can now split the QCE driver into
the core part necessary to bind to the QCE DT node and enable runtime
power management in order to allow to drop the interconnect votes, and
the crypto part registering the crypto algorithms. The core module is
then enabled in arm64 defconfig while the crypto part stays disabled by
default. 

Merging: Once the fixes to self-tests land in mainline, this series
should be queued through the crypto tree with an immutable branch
provided to ARM-SoC and SoC driver trees (with Acks from SoC
maintainers).

This depends on the final series with fixes for the QCE driver:
  https://lore.kernel.org/all/20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Correctly check the return value of __devm_auxiliary_device_create()
  for NULL and not IS_ERR()
- Fix a comment referring to removed ICC code
- Assign the auxiliary driver name to the auxiliary driver structure,
  not its embedded platform driver
- Link to v11: https://patch.msgid.link/20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com

Changes in v11:
- Rebase on top of fixes queued upstream
- Drop Tested-by tags from defconfig patches
- Tweak commit messages for defconfig patches
- Link to v10: https://patch.msgid.link/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com

Changes in v10:
- don't pass a NULL buffer to sg_init_one()
- fix byte order of the imported hash state on empty finalization
- don't recompute the CTR counter in software for every request
- reject skcipher requests with a too short scatterlist
- check fragmentation for empty CCM decryption requests too
- don't use a static loop iterator (duh...)
- initialize the return value in qce_handle_queue()
- Link to v9: https://patch.msgid.link/20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com

Changes in v9:
- Rebase on top of cryptodev/master
- Rephrase Kconfig help text changes
- Link to v8: https://patch.msgid.link/20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com

Changes in v8:
- Add a patch making the crypto driver *not* register algos by default
  but only if the user explicitly requests it with the provided module
  parameter
- Use the "offloader" name for the crypto IP instead of "accelerator"
- Fix device module table issues
- Make the core driver use a list (despite it only having a single
  member now) of child auxiliary devices to register to make it clear we
  have the intention of extending this once we start the work on secure
  media playback
- Link to v7: https://patch.msgid.link/20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com

Changes in v7:
- Add follow-up changes converting the QCE crypto driver to auxiliary
  bus, adding the core QCE driver under drivers/soc/ registering the
  auxiliary device and removing the BROKEN Kconfig label
- Link to v6: https://patch.msgid.link/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com

Changes in v6:
- Handle all zero-length HMAC finalizations (like imported state with
  data already hashed), not only the genuinely empty message case
- Add an additional patch addressing the fragmented skcipher payload
  issue
- Link to v5: https://patch.msgid.link/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com

Changes in v5:
- Dropped patch 1/8 that's already queued
- Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
- Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com

Changes in v4:
- Remove remaining ECB and DES3 bits
- Pick up tags
- Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com

Changes in v3:
- Remove even more algorithms and dead code in patch 1/8
- Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com

Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (4):
      crypto: qce - convert to auxiliary bus
      soc: qcom: add core driver for the Qualcomm Crypto Engine
      arm64: defconfig: update the Qualcomm Crypto Engine entry
      arm: multi_v7_defconfig: update the Qualcomm Crypto Engine entry

 arch/arm/configs/multi_v7_defconfig |   2 +-
 arch/arm64/configs/defconfig        |   2 +-
 drivers/crypto/Kconfig              |   2 +
 drivers/crypto/qce/aead.c           |  12 ++---
 drivers/crypto/qce/core.c           | 100 ++++++++++++++++--------------------
 drivers/crypto/qce/core.h           |   5 +-
 drivers/crypto/qce/sha.c            |  12 ++---
 drivers/crypto/qce/skcipher.c       |  12 ++---
 drivers/soc/qcom/Kconfig            |  11 ++++
 drivers/soc/qcom/Makefile           |   1 +
 drivers/soc/qcom/qce-core.c         |  92 +++++++++++++++++++++++++++++++++
 11 files changed, 175 insertions(+), 76 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

