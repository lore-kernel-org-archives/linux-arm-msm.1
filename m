Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA8C4D4889
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885520; cv=none; b=hULGaVu2TO5cRWS/sV0J49T7p+5/YH/TtMF27sljlW8r7G4DGL7XX8x/qwhfdCyhVnzcsNGP5kdAJO5hHXdz2qdugrodh21LPgkoRsha7Doq8ZXLvXhSZQTkA7qwuhMVEqul4Hf3UKobPxtWmduF/1j6VwUnsS96IGs6HfUqwAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885520; c=relaxed/simple;
	bh=Zej6tEVXY3XS8Ou3kHT610dqMJ17NrWOQ8e38Rvr3SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USHIrlfA/KklVHHMw5e2KcxCwNJI8EoD40e9hmEL+RTVy3ZuSXA9pTmvpZfN1ENfADRfrWuzI6NmUvEDs8SdEAifULjoUfA6ZXMWW3eMmlLuzWsq3IgelGXNoNL2hNiM5lz8Ni2lT6MATml1V74h5hwe5j48KMqV4FSfR9OYsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoWNrP8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyRnITmO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoWNrP8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyRnITmO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Ys9M3208378
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=; b=hoWNrP8Qrro4vjAy
	D42R+iPg9d9TYtbC1gV7p1dfbfgD82DSfB4y6Bh7fjpJkkeLxLvJF6IJS7vTI1Zx
	Y/mh4ft1dvhtImbHiHgqNCZYgwvxEnPlfpf/2jCj/brRvGHaUBRcutPmsFb6uaco
	KKZvhDoxrL1n0ZycClYcR8V1iyew42+9WegB3jbLUszA7RN/WgOt6K6LCSANZjcb
	z4kRxivrfYZ//zMctarzoo/6MkgMfkK8OQfev1cuU/UfOBOc6UGRd8jTcEtfJNB4
	nr22oI4vPZ/VJBxU53vFFBWTh5FwRTsZ2DC2ZEnsvfGyfi2sIXcDObAJI0B5Qce3
	Ukqmdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgu0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so583479085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885517; x=1792490317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=;
        b=gyRnITmO8/h64cM3BTd1Cjb9idkfwUAVAZcqhVU4Dupcs6uu8TYUqwjbz5DGNzVyMD
         +W/ibQ0BueXoFltvl19FO3r3DmSxvSIUotq9mI8rm0Nm7sk5vUCzfB2R9SCFtdwQ8Mk1
         /OveOqaSkOLo9vqA0Y7QJrkVMTyS39cGotkLP+/tThaDwp8mf8gpn1lzApOfD54MYBKF
         OOBGzRqFtJJTfKElgDyDdM06yfev832gs0wecreegnn0HncL5L65JjgAVCDO+6XhRr7d
         NOA566grzZEOuetq5UE6JoJf6ppWY+8YWGpJMaHxl8TI0aKbC4eOeblohu7ZC261Z1HO
         c46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885517; x=1792490317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eAsNUcYBlnueBVIZsmD55eeC21n4pLWK53FWNyWHAI=;
        b=R1dH9TqbPSvi8w06uLlNNLdr2OBLEkQsNiUWCdPACE+olNrfjPen4XbQKFuiI8IFet
         FM8P1meu8GjqTUbboYyk62fVyWXPmWsigIGRnFDpzGtIHo9HhHRu2MclpCrrUAXjk0Lt
         GItcJLmJdtaFVBRDun3YKyFvXRizLzz1qtDKj35SnVhcVOae18l3jtGlk7oZKRYK6xgT
         mrcXcM05t5JplDWX/irzcO8hwDmkKvyBe2v09QbGCGJGxu3kYd7QgBIz3RtdlUd/ftmL
         0d/aJWte4HUV/d+S7k1JzMt99jx/aCAHntzniuDNxB3RUVqwccc7kzbx4TeTB9pHbYVg
         RWxg==
X-Forwarded-Encrypted: i=1; AKwUvByeJ0H4KKLV0EApFPfrEwY9OiXHPRQWoGD9Px61TwmNWjWjM1Mb/zKqhnjzNymcm37JU11ID2qLWS4aISNA@vger.kernel.org
X-Gm-Message-State: AFq9FYLSGyupgqGpa62l01ir/HuY0Tge+YF7uJBEWpRbKRLgICyUzMsx
	nA2bpw9+uqsF+ErN9gTZ+lKRcTSuG0VtGRI+jHw6U4gGf4Cn/43sk7Eo7IQp/v454Q2QEJVxRdj
	iyo+XDj7XGCrdwPnyupHCvaPgzp6N39hD7zWg1U3A1ZUn1eps/smavWxGBkBDJLPqO8ET
X-Gm-Gg: AYBFou1HTaVom+xcPwi4umK9OkDlOrQ7zvi3ILPqQnaa8HFWFPBDh+S5FWjrl1YRN8g
	pai02kX+16BngA98oWlhouzq09BnyWv79l1GicN4RIkRjYe+49yq6c5VqkMHGEwuwy+qdVyuELY
	Sm+to0qRvKnn1NNKKaqf8b0p2CJ9QvK0J6JtbhD/dVo3CcEfKLmSsTR1aMS2zCL3TXdYAx/jU+g
	1Eam69d/63N8IG0yFdcADHwGOvbeihg1yWxAZRXVAdWgiYGijy4PwgOKuEuIEfjjgUg3+F2LBwe
	9SO5NTTI2zauSXkoqmSfzqPQyH7QFFq/JKAxAe8NeIkp8MU8O2t1+AyYvHixyvRB0JMzZHDrtpO
	lP7ANUH/eECjagHuCak0shl4AlvgB
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2035736585a.4.1791885517121;
        Tue, 13 Oct 2026 02:58:37 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93ebd0cbba3mr2035735485a.4.1791885516739;
        Tue, 13 Oct 2026 02:58:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:42 +0200
Subject: [PATCH v10 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-13-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zej6tEVXY3XS8Ou3kHT610dqMJ17NrWOQ8e38Rvr3SU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCll+EhDulWQ9W02Um2eDa39pLKRIykk64ph
 aTz7hktzNKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApQAKCRAFnS7L/zaE
 w8pLD/9hCBxRLV50KkpLeMAITMx8dGDibLyEG097kwDGhfxQlV23KclhNzYiItO/lr8jVCjSwr+
 MQYDa245NgGOr5FVSFtBno9ifIohiUETJExmq/id+drO4MqcLBWT3MB1t/X1RPZTEaK6aNjLH6f
 u7do+pA8jgZI1vhRNteveR5Ba3DvUv+PvYugpwVCzSTzl59g1c6yai0PdCMixYPoWNllIOWZnCH
 fYIlmQp1WtqWjdMNBde8pIC86ppgFpklpzG/23wNmAHKE92ETqBroL8fxlf/j4niz/RvkpAwPXs
 FDJxmX7/qmSyqkf9WRIatqDzKcrfMos7cA2otaiWV/H6eLOJwfZbzckwbqC2//+1fNY4KgaKwpI
 n/vEElQihitwhME69GTu+ffO5lvuqIPlRSMIvBe2ffkdXM4/NSiEf7P/yZuSgpHEdeIGXzVKhv0
 aKbmK4fI5b6JzjLX5vMXQrfTsyuIUmmRavsqjaeDHQtMLB450+7Hz2wKJ+TEpgjc6ymw5/CJ7iy
 AcGqVis3WjJdU5sweCbWbDfl9MsgTQC8JeahCcu6yDpy6xwYv/1GNpPBEj9pTvvr5Uue0z9oAvb
 cC2oTHnJ6bB/V1aoZHrr1s5qeBSEG+xdhgj912MdWCs0sR4QscI1kk8l97hjurQcRBNHltMruIj
 +WEle0qHgQqgTvw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: TKyT6quaLX1j1mlFsXbD_OVOA55wogNc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXztintpDRmx6o
 0zXWqnvwJV8yDknzC88FiaLYw3pIf1rL7OygdYCcU/fludhrTqAT1owcbsyZZoxsYAW61/Yk2s4
 FzMSN64xjlQIKK+uvqg+PJp5cqyV7IT138UY5zHmAlZHPMiDyG4iCbCLOV8U1EFpav3JNvkyMWB
 m1KkZOGR6sHMPF8+qLR4JgbYWLqPEYLoBrzutQar99SxcflFJJGH/KUPqhUgAsEAKVbnL175lZq
 ISouwLyxp5FBgGPEp4RrltAF9owu5IxYbV5MvAJvDoxOdg5z9ynRognzp8D0JtoRMuMjrkwsgh/
 nJJypLKA+tKi7pTCMpVROtRV0FMRTfpNQ87ZJvDhgTqDYRWGcSJLACk20l13+2JjYC65cmDBE0F
 FQgOeQpqRJT9eJikqvaVHtCDGh4CmT75yDbMB+XpTwqG50UxNF2bg2hzRE3WpnWILs7mPJabJ1H
 j56kCmiIPHlIQmw1CGg==
X-Proofpoint-ORIG-GUID: TKyT6quaLX1j1mlFsXbD_OVOA55wogNc
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace00ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXyFk6OHLYtvGK
 aEnZxtbDDdvQwuVS0BzY3b72OKvZPK+0cY/iQaiaeI8BlJ8BYBUIrM8A+psMWBgGw0mms4s4Yco
 BBjvkW4dU6RIrRvID4Vhy4+H9XkRvls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e80927f87ff26fe3f51db6409f509fb99ad614a0..760f9e9fb2ae13392563ade5de871a5e882d195d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1663,6 +1663,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1949,7 +1950,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3

