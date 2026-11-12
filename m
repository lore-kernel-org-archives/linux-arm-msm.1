Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492658;
	b=0SaIAlHEaykn8jLLlL7+bCafT8x70O3nFQgKGtvwaAo+/Y7d6FMohLaM+T44h05nG/sn
	 G/NrGzpYLPuEpCcSwbEL1hE3lA4fZLNZRCfZ7x7ebVueJjfDwYs5BcypkKBA0TBjBZwK1
	 A6Bbs7dLFQrrpr0aMg0uCCmbrrPWEBKVpWFp9HiOW0sSSITLZF4/2AsAHo5jAr7hCjMWj
	 PROBn7Gt3MoN9ftftJ4zZLNmx7ZxbydI0NUv7mny6iWYtT2UBw+wa060qLyUYP/CpdRhB
	 7Thvuixy8tu6JlLXKmuWtBH7E9Y7nBKOo0OP50TNCIMkAkT5XIfuZ1Rv20TGUyEqIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
	b=ff4lN0/BnxNydE9u/OAAhUIE4gGZ5I6LMYBW3gLq8Y+pSErjqmaKcpFELSajg1bCfLJ1
	 v8QedJhi3Aord7U948/MqqW89tWxdYguHCHNqRo630rI1kAqFsDtIYXAOoFxKClNfgYIR
	 R3lM09X6MdBLVqEtA0GthM75pQL6TpsVK2vyNZXq4sZ70vrxgpkT6vqoruRSwiMEcOHhu
	 676dhHwEEnawkRQrZAwadiKWcqiKWdOvEjRwcRbq2eeJl4v/D1pnDbqkvP50DpxfKasgi
	 zvA27Zw/MedgPhWaMTSiZIUABK+TlmrMkKNASuZBD7LFbAzPokJ8htc4hthHPEUqmhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q08zPKvt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BETrjSf8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CE606A8B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2CE606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q08zPKvt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BETrjSf8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9NZGh2514152
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=; b=Q08zPKvtWQ7/BhRg
	dADUp26Zn50BB1nOQk9IQoo7l4jpWASz8V5Zz3+dBG5oVqNrtIeqX1GUINuDREem
	OCqRCueHPPZpXpjnJULVG0rESSrg28b6cdWsuj+3xNNwFxq3owvsPj37SdwE/c5s
	HYglpttYh8ysA7XMocq8xRO6NpO9oeeue3mOllSJ6pyvcU93gfR7vYC5kocLHXnM
	j4gA7Js4khBI6+6dy+93MGe7fkF6dZJGQ7ijM7h8hJXjECW2ZedL7eeJoK4Y7tPv
	swGedbJsOw1Kfnf5dT9wijHJFzmdDVkXC4PO+RkTgyC6Rc9phdyyEIxdUityaQx7
	Juqe9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1uw87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so1356052e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492656; x=1795097456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
        b=BETrjSf8pn1j4LdDwf+VTGvbcb6Jau2Ie3sQ1NtOjU1vDA+ugkJ3LYFMQLkeeZ1bSG
         EMFOJj9uBKUYw1mA6f5wIGwhQBEqq7melr/GvzwRDXRAsC/66NbCpFX2hbMf+2W4lIe9
         rpaaIT9bXYHZQ0axqMhzV5tXVe3dVuSdCHgoTMFTwUDT1wRc+2IjpLc4QB33k6QXQNDk
         JlFh6u1fhrH9rj25u9uh7O6s8G9LLXmIzQUvxuTOu4Q6XoRFw4vZSOj8KA/9coItnDwM
         SlBlxBWgqWdOE/L4yUp8Lov76YmU1F59mSI0sR01JFm5TiQ1Bm7mQ6eM3H10HFfAxZp/
         652w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492656; x=1795097456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KlceQbgnYObNWEcS0jcHmtcmOkNcG0VlHdLvVEaUTM=;
        b=RAe4vrMbTT/yupyF9N5/WN6ixiFL/WBqupPqhIxzHQDKQFQ3sUBvTMaQqlL+XG+2RA
         vAKz5SoZGKI2EnHPK7MxVnWJUR761iROFz8OApwREQt9asMh8tHR+pBsHn2AcR2hGf4K
         ITtBdk+hM3Xbkrb1ZRboPZ9lwOd28OKsXi4k4pHY/SfL7LVoU8Jufyjkws/PikKZKEHi
         hD8QVbTQNGg5MRNlXMtnZ/lLo3KMky3DPnAzpI/5KclNd8OoCF5RplwA/xTj6cxFA143
         1iGgEU/47DpmbZhJZ14INJTfzzE1HO70Ul1Qx7xfzWfhVN2/y4Vtg7A69XSbhO70185b
         wt0g==
X-Forwarded-Encrypted: i=1; AL+hErEco++2jpsBHUR389z0fMcGO1rLLkScYyiKy6K6R+WCa0KvBvCv6FXAs9cY8SWfhBjnmxBRlbNFlquCFoS9@vger.kernel.org
X-Gm-Message-State: APuU4Z/motZluRKX6wMT7CLpXEAKBYhJdQKPW1J4B7fBO2GzKd+55Qry
	OoXYTSZ2K4TVFFwHQz4Bztjnkkf3OXyBKjKRVd5XVzktqZWRt0fz1z5uz1eMSL6wtpGXzR9KKc5
	sIszA9CVGND/a645GrV5BXWP89IRh2GuHSJTGdrH3Asg0p5xeMPPzbRzAKktoEbLwg6Yx
X-Gm-Gg: AYBFou3IoxBqp/PKCs1iaGLN9iTXU/qQ4mCiISnL3jM0boy5pu5FhqRCPIT5xKzL7Qs
	YqYxfOnTkEo4AiFRq9SmBkn8OLHVXjYnzS6aHYNGir+yi4oUkLLrYm2eRCTmKkdPSTVFgOrh9Wm
	BiCDkh94AwwbxLaDDhOImVvCkG3mxXnHnJg4er5nHofYgz6wQ9EMhXvDgsWde5/freB1RwgUh0T
	T/wI+YD1eZg2C+lHo2FL7HS8ar65DP75CODNn78K5PpTHRf3JUr+EVL/y8N74dsH1M2jcbAtjR+
	ipe79AHbgWITrOPr7jJfVsHQq8W5Szg3oA3VqzTPmB2EU8BFU7bwxP2P8BWZNqPHuQjU+MEQk0u
	2mAyFwp5An/WLnPGkVxNfmELoIMvuyhS3X+l8oYlA9D9P756mgaOQ3e4oFHQzYKdLRjgsPkFeqy
	qc6dg6hR+EV1KzGv8sRzBKhet+CN9WdiMrtS9D+FTLPy/vUFUntqHjrxwkusqB8Lg=
X-Received: by 2002:a05:6122:3286:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5ee1c3fe5eamr2294780e0c.10.1794492655825;
        Thu, 12 Nov 2026 06:10:55 -0800 (PST)
X-Received: by 2002:a05:6122:3286:b0:5c9:a60d:3276 with SMTP id 71dfb90a1353d-5ee1c3fe5eamr2294739e0c.10.1794492655342;
        Thu, 12 Nov 2026 06:10:55 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:44 +0100
Subject: [PATCH v11 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
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
Message-Id: <20261112-qce-fix-self-tests-v11-4-b86a65ee7107@oss.qualcomm.com>
References: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FctauFHZADEzXXldL+PPLca+nRIKDHu5xhFRwimXZqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlCVirX+YzppCZQDD7Q8AvfImymH8ZnTh2S
 ZJ/vwk3hAyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 w0iSD/9/2ZqsJSw3c5O4JMZk8f3SxL8A0Hln0Zj2cOCj4wFI8HOgqaviwirUZRlWo8qjhjP/9/B
 MzDmcswmU681m7LO9AG7i5ll/306S+G71IBN+owa1tfaCtj1z4nRQ1rTHj/oxEZq5O9s7udaKgk
 sYIumk0AVBanFjk3sdkpPJ2CDV4C0Pub6DSGzIzbnxLy501Q0a9JcuUmaT77OlH6yhi/UvI9hG6
 dSEPhyQPBN8JRRa6v32M/AKxYMQl6WDa4jCyARk8AHO/3qeEBPVwbEO50LI3t91WFtx0jp9ZcCB
 t6wVvD16WX5FhO69Je/2N7MhRI02s+oi2V2DLZLWcp1L+wmeEESgmcKWZzgxllNG9tG6jvnsW2t
 u4bN/1iYJm1ny1hoiGEIo1VxVZqWhUj7aJ0RIhaTrbCQzhNUjApD3QWKPviPx8OfNJAYehNEyu5
 vf8F2/Q38YbRqWEFA1NH3TavFkMssQkvSHYMYfCI1TF6FCiqyMNE6yUafhChQo132zWZR6Kj0xq
 P5R6aXe4GBBLLPRwRrl5UGKPcesqKrmdUnJ9eLFZ2mI+S/UAUfvmqlwSmTH789OUX8L/B9o6UFV
 PUoc40n6t15RSZrQFIoMcen4tz88G908HtwaJB9csvqa/vY4UwwuhQ+2Ob7thoSesAY93GLbqge
 EJ+ziK/bFuvvLTw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c8f0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: S5gbM4GGHDfVVKLl3-NlimjW6m7LdPIm
X-Proofpoint-ORIG-GUID: S5gbM4GGHDfVVKLl3-NlimjW6m7LdPIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX1T89U5wddE70
 /+nxqIkBQ7YotD6cnstN2+M8VPTQZgipAnszOxw2wn01ALcCTwIKs4wbVVMg1jqZN1ZhmApo6C2
 F9PPC0GFC+jk4KY3EK5Johv/iLLORrTG+4ptKY9ZD9VEo+yPvg/YLKY9zZKk669IUz3Xil0hnnB
 gJJw0xTzYa6iDQMn3s63QkdPGKWFYG/KqYjljhl0L3DeMT5q1F8uOKR2B2CPC8SyAmyvVqXagVo
 2q9c8iMyJYnQhwdFMUbXCOAJEY43YWp8L4TWuSn8yqQerwfXRFi64COtz78iHUAjb0MONBUZB+z
 74tP/GsYwN9afTWSLUgSwuuaXIZRgiC4s1kT/uy+EBkV3k9zK0f/QcPJQP+nVLLlXOuajcsEST0
 MgrnrDrjH9hIhPd//wBoRyTA6RkWbsv74Sbshcu+M6btzy43G9r2FQzyiS1qIfC8XGhRrJXUeyr
 5e5+XqMEqy855tMlIGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX8ZC5XwzB0LUP
 xHWF+lqFYkrwSECp7zn9v7iQTa4j8Q5IGCHA54R8mQFuFI/z+j5UWMTm44W3ag5pIlr6H6nmZpW
 JW9D2dx7BixiT8nCD3jz4OXrgS0KiFI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120056

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm v7 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index fee64572027ece8a07524db7bcef5a4ccda71339..40b0d2a8ed1eff5404dd6e821433044475043880 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1134,6 +1134,7 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
@@ -1305,7 +1306,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

