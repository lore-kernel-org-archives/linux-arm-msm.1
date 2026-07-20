Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC043C584D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539555; cv=none; b=okBgsELpdU2bkaI1Lx64dS5EYzurOW0zLdMv1oBY7lR63IUlnH3zZdq99omEql6JUqXy2QM4LLUzqhmuzOs6sy9lqTd1m1XOYXacGxAjqK5Pe0Uxoc47nxaoKW+zAMUku+rYDH7IgPGqjfvHNYf0wDg4svBAkpWu1fEuhGi72GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539555; c=relaxed/simple;
	bh=A6rTQywiVuri+akWPu8ZuzmrgFMwkmEBL5RABzyTsAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEoGeFgD4fNyp6G8DjP+dszGKaIO7totmH5+cjsbzQx1HNHMXzS0yDNscmyg6X7VijuMWW+26itzh3YOboq4Ek8+VG6yhOki+7ShtWSJFzyb/EVUB/sIujSKXFtGWbS2TQmNnyguqOtJ8WfmGATsj5DmHGYJoFx58GrJwmngq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTX3r2ny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bof2vRMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTX3r2ny";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bof2vRMF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RV1D1420166
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azoonAs2rZvyyYgYMRjUol9O+q8eXf7OwF52OR7cKds=; b=jTX3r2nyWsHMgzxn
	8FiVrwsN9vBocFeW49l7ldKA5XAZhAJvTnfLaGPyMqjBxsPnKZBOPmOYXmAuXLVY
	4sWAiXGaTX45boKk1A3m8XsO7Gmxi/ELddH67Z5gVDiX05ykqVAhWHKtR+3LGKie
	veQisNX1QTgE8ROX03T0wNSpfnKt6iykthul2wHTYqiKsUZQS+FSKYyXOCuBYwzx
	FP7tPplooLKcPdtEWKezKg9RXkJ/Rf/nlqNN+bdT6uAg8a8my1SerICuKrd5eD+U
	UQmT5/Vq/x0vfqtNbWmWRgO1GD1kO9nqhZUuC2tvSRXW5+IyGky9YO1InCixmuof
	tFEEDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7wjs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:25:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so193466891cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539547; x=1785144347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azoonAs2rZvyyYgYMRjUol9O+q8eXf7OwF52OR7cKds=;
        b=bof2vRMF1FcBIKSY4k90Qj6BOt5laGjy3hPHzYFIVsp2lVChc26CH7uBj9uJuKJNte
         JLFdoT8Xkf6941uH/C/YAJmcwbLqsPq6K/loowxxzIp1CaafPhpVQfJjEySdhV/sifim
         9mmrz1Xe0MUJTZorEXyEno877epONbAxN9OugH/j7HINeKpgPj3aVqhCK0os0E3MOcAf
         8Dl+wRMrCXUvxlALiXai8IxJ++IqdAaIRPcOcZMUMpdqaZMd25eP+FvizU2R8gtf3mV3
         L1RwI9UDdgFHCHaqrN1gjeQ+iAeTktky6WwvSxe5LrqNxc9JPpR7VeyeShkvWA97lgoz
         GCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539547; x=1785144347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azoonAs2rZvyyYgYMRjUol9O+q8eXf7OwF52OR7cKds=;
        b=UGZNgnVzN8vloKIc82Ss61vk0YV6J9YZ0OSu7FDmN8E1ramNsSamWchCDmgh62XgnJ
         XVMoKEJCXug7IShMAqzLNK9JM+6EcflgFZZWMkVvvMUvWsSX7P+hx7W0vuitMlvT1TG+
         uz7EzHAp5+IYFmvv1ECFgN1XX2zzQMWf7CiFsWDelY3WqnTnwfno0s4gOsehNfCqoj/d
         4tx2Kr1B+zbCJe+fPC3ZRWa6dDoN/fCK5cfTg1SWl4VqMJajXLmfVAdl63Sn6SFLAA2o
         ulOabPwRwBWN/9F16lKKClfzG0jMg39O3nT+s3RYk1te9pc6bRFw0oAjo01PhGXeL6ms
         Gl9g==
X-Forwarded-Encrypted: i=1; AHgh+Rrmj2aq40Lu6Z0H6ObO4MC1GyG+qtvLZAqSHwaGgOOWJVHW7zk1KXAmlXRI3dTeW0szMjx5prSIKjyC/WON@vger.kernel.org
X-Gm-Message-State: AOJu0YzzDsLICl4qT7BWsHGXGsDt24hrwqk5RW/kN+5w4isEVhN8jxUs
	zz/fW4OYVeH9/+MyiQ65IbPfKIivf6R9IyikeIxPdu18Wj29fuVMP/bjzAJIwmFD6aaKh9+gHwR
	I5jS54DJad/93itntmzgUwTazMtvxV3qKHxJBPnd3LwQCb4g5tMAZU04dxYGlcWp6/CvF
X-Gm-Gg: AfdE7ckSEw5uXinxhuWVqYakrQ3uP56MDxIRy+Gmt9cz+VuAH4usM2Xmc+0iJdP57md
	Ui5tyja3IH0reYtnY5s62B8JbqE/Bkf/wWIJB7LLUa3b6W4YKcRpq+wM78qe6b1Rws8B+1bYdSO
	DYHa7HhPAnUrPq+6C4Plcpaqgc6RIcz94LXfgRy220T2huIk/rIcczD4ZONU8V8Z0bKqLBmImwT
	cHSutCvol8kdD6v32Dcj+AU2OPaBVQNdIZSwKm+O4467UBtDPo682KvW0RW+P242G3QpOPOULiB
	E1d6XLUKA7vSTqcwc2rI9CfvlyCqyc1RVVGC7ZBRbnrz5VW79kRLfK6ArSwArdmLWUjJNhrxMrT
	CQNxXQXg5UaKrkCnyOllXDq4NW+5Ecg==
X-Received: by 2002:ac8:59c5:0:b0:51a:8c9b:649f with SMTP id d75a77b69052e-5213d0c7347mr123946631cf.67.1784539546623;
        Mon, 20 Jul 2026 02:25:46 -0700 (PDT)
X-Received: by 2002:ac8:59c5:0:b0:51a:8c9b:649f with SMTP id d75a77b69052e-5213d0c7347mr123946431cf.67.1784539546190;
        Mon, 20 Jul 2026 02:25:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:53 +0200
Subject: [PATCH 6/8] mfd: tps6586: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-6-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A6rTQywiVuri+akWPu8ZuzmrgFMwkmEBL5RABzyTsAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel+JVh2LLebfg0Z60TjK/ZqooFO/E063bUsn
 DcFFoaXAHyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pfgAKCRAFnS7L/zaE
 w2/uD/0aPKY8tpTuQyVi4bVwQxAwSe5GwjC2DtgnMo6nh/diKnBHmP8CrS17h3oxzaLBbpoQsyv
 Sz7j//KhI2uvM/6lsN12ObBAmWBE1OIY2cI2EITf9uARRqijYfV+vh3K099Z2WSPyIztcA7JV1a
 LXzZb7ugoqz2dMzT1dYxuTYTKlupbAIUqn3iCnldu412Ogk7U1TlAiPXUx8NUiwcSTgNJH6JtjG
 ybhBOe1z5foPXCLYPHg/mB/yn58+1Cndf7uN6COgbJKsYybBcSfm7GwhrfIR3kOESCkTPUQ/wKa
 CtSLDtJYyB3h0iOJVjA1wxmvViV3DncYABZdM9JhjlGr5xekEnOEIkt5J6dyoA6W3qAdQfM+wDe
 WHnnp/KwxzQBF0DZMHAzzpoGyj4CiF+A0L9ufwf2uDn/Gr6QSF3i1uh7g3B9Au9fYk4fZJVPzjL
 EreBD5gpBiQV4/muSmW+73v2B/YzUR/9/++LXGtpFgoyz9CAYZz8Hc2q0lwgczqGG/yerhUZ7Iw
 2svI6neY8mLXD64gJd+3QIabFLBehBoppvlO1WSrRtFtjFWC6wlYnhuX3lwh2ugV3XC2oWE+fzO
 N24Bq1v0R7mTGsTx4YHFYiArfM737K0E9k47o1YA1cm04PfUgXMiuD7g5S8kXEV39VNN8Mvf0py
 8hgioC0XlGh1TYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX6kHV0B7deICI
 hMYgkLUpNewOwmdwkFSSTDUMBSeq7wdri/3cJUqsWTqz5kGR0LIWq6FzjQ3oNW62TJ/67JSxxIM
 LyXE96w88dtMXswxJ3vWAvR1XsfLNB55xLUVoW/TxR0wqnUMRdU318Dqwjv7f8u1FZ7C7RVbf9f
 xmo9WHcPnKjAX5nwTjyasL4CagiWG1+GqemyrL1WityZMyUCUspD6Eun9HuDjBBvkdk+ZeD8a6I
 F+c/iSZVBPK4+WVaqzkt2WDcMjqbGm0WKv9rRqQ/lnRoPIjsTqDYgu07rueZTptjF3zZlPc2gq3
 2R4Qk/+idS8mnDLxculFFch9XDzSyDCR2u9jXDpydmEAFs4PLrE4zLHI92u1mPTtDGHPvO7X6cT
 D0G+lt4z46oXqTRTMT01RQvSK15h4Bg3T++BuXW/FhSOQ5QN87yT/Js19KHRE7cXK6gF/UxUPxr
 GT39Pk8A+yJ+WBFd4gA==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5de99b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=s4_jwgGKpBPlvUtSdncA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gCt31aGp6US8SxclvWrdqaqbWJ1zMmmw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX0xFrBzPVL1Pi
 v4zkYeu6qGpYMEMDMutz9zD0awyfHpArBUS+tlWUxQjghdKQCgL+6SLzEey68HqAoUSyA/SYZCM
 d2suLOhGHBiCd2O1JxEqHZcu3pAo2+0=
X-Proofpoint-GUID: gCt31aGp6US8SxclvWrdqaqbWJ1zMmmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 3cfd2f02b62f3cc370e0d970ec2643b638fd0fec..fc7c4b55c385416741925904abae4fd240f55b13 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		platform_device_set_of_node(pdev, subdev->of_node);
+		platform_device_set_fwnode(pdev, of_fwnode_handle(subdev->of_node));
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

