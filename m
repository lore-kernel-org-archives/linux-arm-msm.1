Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895544;
	b=QGY9cGYqGMLb7ablBxpZkud3UL7iMF4qR+/867k77yuhwJe5iE363X+2ddcFhzFnlpwX
	 2BXzyO1mvqmeoq2XbJA7M0r5/O+YJRa/ulqMeVGME1u+ckkCetq4tWJ6RvosVofAHwbr7
	 OjI1FcNXTNz+jODsDx78TQHJv5kApzf142BiZuoA/mTgunuotR03TE5tlIoWxezyK+poT
	 lZ1ameb1W6AgOLIFnB6j2Nof2DGvlLmZ/LdaMQ1kPio0ahfg+cLb9mA0fZQ5OpjInWXNj
	 jKTbsSl2V/3TULK9vXTwzwKy3TRa2lu1zg6xuO3+2EM46SSFkW7ONYFrV+XBkaRcRRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FcJOxiSipIa3lbkmFsBEsrX/6/5m87I40dDnzNRDJEI=;
	b=0JJKKXYM16R/f0jS6EQHikhHqmMfTuN8kAkoDCq//IEDws3l0iux4vfqw/1D23QnL9HI
	 KBfK+vKugiyg7V5AIkvJ/YpGaaiVhQnS6OGF9+SGAgyxqYBUAYik9mHbjFv3W0ciJsoQh
	 ixhSN6sZCwNogpZmLxptMom1CMkQfCR+NmREYUwnrreriBaMk4TSVm58cjMTW0SeONHF9
	 7/MxFqJlAkSX+MR6vXY4chYni/Vle+q8oaFgV/m16X06JJCCWWiDAD2CaPoTsesg64ml4
	 TRj2UKG5oGdqV83OFdY3nLajqCyu6eHKCSGMGkFVPlsAAkeUgLQZt7wlRTCurUiLenw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MX3eRFb9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJoEZrDf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F3606EE99
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD6F3606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MX3eRFb9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJoEZrDf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQVvd1657303
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FcJOxiSipIa3lbkmFsBEsr
	X/6/5m87I40dDnzNRDJEI=; b=MX3eRFb9OrOtCYseWWLyf/hS44iSdGzDyMJ40q
	bcWrjZep9TMr28KmJYNBGVSm21a1JOWLjeGdDWXDEboM6Ucow0NF2dMvhoOavCDt
	85B9QLQyekmWJwv0QRK4/KR2cJQy1nJlbqgLUQ8v0Icnz9G4/uIxTVtLO0EOq0IX
	2DDVepFiWkOhZKDjoyJ7GOLywW9gB4roN5jPOEb/q+mr2INys5H0TzwEtadHV1PL
	m0l2p93mxgYT9+9Srm7IiSZnF5ui4kk3rVOPaxxbcVbQcu40RsuY3g7fuKjOhdv5
	+dEPk4Q//ZrGbethUX1asFng8mbPmp2P8xZj9/GhLT4APupw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f9pru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:19:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980b637ed69so541564241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895542; x=1794500342; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FcJOxiSipIa3lbkmFsBEsrX/6/5m87I40dDnzNRDJEI=;
        b=OJoEZrDfXzijqaYJlvdzD5lwXfSUrVmqLljribq18NuWWFxWj2m5jwdrUWIroKlG0S
         eyGsGubV741rom5x4uug7UX1HS9AlRqco2Lu+Nw7RjTTIEDopi6yRr85hGCoKYMek1h3
         rb6s+SMWjctMsmK841MgKpVtFhMLbh3BW8GPMA87G2MLjk8MKJOYDdTCQ/jnOEaonnwI
         jluCT70zKRzkWFtSnOG+cFqcHumNdFZ/w0fTerxL/gFfW3sjOBEkgmNmFb1j95kTOsbP
         Tg5jLaUbizGXcmXaTP9iTBZLIBxR9XmewkZ2R1Vo5ruu22b2NxnmwH6WYkyQAwoSRSuL
         Grtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895542; x=1794500342;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FcJOxiSipIa3lbkmFsBEsrX/6/5m87I40dDnzNRDJEI=;
        b=fm1yWpb/a4PI+vg/qxK8A5E/2irX7N1DOh/VFH9o453V8GhXgBWJz130gFvd/CkhFu
         l6t+XqZtobjZsJg5/lVHHAnX4p4JTmhdcC0UmffwqtRuEyRHlE3DjrhyLY5WkmHkWq42
         6mn+5u1o4ZvfhoUED2U3d6bMTv1uBM685/39D4PPgn2Y3N1GElhssIf5rUWh1sHes+Ki
         wbzUvX+ALyuwTAbu0bocBAQZPVq1UBwPnQXuODjtNBzF1KhOqwU++nXx+uB8fjRC8kNQ
         89JulzajqrRuQiNfpK5kKJAzYzB5IhiZ1IIHJVXzLu8D3BnruzCzcuGBrUH4sdXJhfIP
         y4rg==
X-Gm-Message-State: APuU4Z8ECgNV6cixjUDmE6dIDObZpKWcfBJdTFJuf/2vP6SfaOiLbndG
	PzRD1p7OAFKvuyBShoQWyCNAaE88QcJZvWtP6PyxvvpejnPcawOvHp8kRO7UYp5VPqkChZeEpsh
	srVB8cOupL1XFtKPkgAbIw0rh/0HpRmx5VhAfukIF8eb6yaf6E4OBBIZavy4xxD7wj2eB
X-Gm-Gg: AYBFou3xHA71JjG0B46ElShne1bQJvfS/lUyyBMuW3buPztwfyNaNqzwodbFc7rqwMR
	jh3HCHoUIxtkNMdUGT9xzaZypZMuRttmIsjpkcTsx6XIIX+3n2CqAWyRw35uSnu5k0Csn4LBrNv
	f8KCv4Ht835C6oZKsqoc+c0mh6AdtQm3T0FCIcHwlFuGMR9h+VE9iQF/OOrXbLY5/7k5P4TyQj5
	jW9AcX3kDXBPMGDXtboFhKpsfkfGq8VS2YI/tySZLmPAUeMxJe6BH51yDNzM2xxsf9t621KqTRd
	+v+FS4Q1hIDL3N3SqSB7/DPcLJ3RDMcdqX9/pWCPZXX2PboCff0aNrWHrCTeQYm23seUPFFvt7k
	yHpocE43IcjHSvRb7xE2iCLvpJIeFgmMkaOP4Aj1JadOpl2hqY09PxskjCB7Q/GQOuDJcwLBr6c
	JZ+w==
X-Received: by 2002:a05:6102:160c:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d2a15989e3mr3558137.20.1793895541873;
        Thu, 05 Nov 2026 08:19:01 -0800 (PST)
X-Received: by 2002:a05:6102:160c:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d2a15989e3mr3523137.20.1793895541369;
        Thu, 05 Nov 2026 08:19:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm10593388f8f.56.2026.11.05.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:19:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 17:18:57 +0100
Subject: [PATCH] pinctrl: qcom: check the return value of
 qcom_scm_io_readl()
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
Message-Id: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHCs7GoC/x3MQQqAIBBA0avErBtQo6KuEi0GG2ugrDQiCO+et
 HyL/1+IHIQj9MULgW+JsvsMXRZgF/Izo0zZYJRptFY1HuLtFVY87b5htBs6khUrqsmwo7ZjDbk
 9Ajt5/u8wpvQB5EjblWcAAAA=
X-Change-ID: 20261105-pinctrl-qcom-scm-fail-3a5a2efa79e1
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Ajay Kishore <akisho@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z+sYRV3+E9NWUPA5i/L8SISI8LUGUb1V03d4YnL6uZQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7KxzpQS1HtT93B9G9ebCHgZUE6sRFu/yTU+MB
 roULgGzvqaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyscwAKCRAFnS7L/zaE
 w1dkEACHi+NWYWNPBSDtUdYOsv1S2zl3Y6zL+Zue8MJ+VGfhxZQNnUqWkVzO54aA+DhdIHC6Ldo
 0U0OZGmZqTHDPwtM8aFRqPkekhWcS6ND1O3x6smBGzQqy4dehF5NRogebbs7nJDszlQ7l1q9RuU
 vpCIT4kExvHKNK2FK18S8kFy4za0rTZYwa6uy5SchV3WV2BoSRIEepNT3Mpwkg3OnlZCDNmlTsF
 hudDYkuv0vYk2gjKGN6KI7felVAMfU60j2nQCvtyMGAl+3na2XZFh9NLO9LITMnMpKNt+iuOk9/
 8VKJowPh48eWyALmB8sq6dHFUJGgWmYGbEAkQMiVacYLBVaYzPoRx4CjX6QVUC72HCnvSoHDssN
 1GYlwIQFIMJ95bK15CN5x2ApBxhl1j3h3bjgAHxlf7LnWabxPqMvalIu8ApAtv+oHUE5JO9Qwx+
 5UhV0yvFsIFmnC6reTv2F/12iAYcmXrNSTjkgGnwtklPNhzTkpe2J6994oUklkJtkNDZnVHFR4q
 Kjtn/p+NdnRrvKjnTNTm87x0fGh5COv9FbjU1+yfNf1ibrK6CF52kty3ari3OsMV4xyUhkJAPYZ
 l2eDNqlWU9dCaSIdF8ancsPN9THf9kEM2o2yN3HZznKymTXWIRHTAOVpPimMklAosmDyXLpVjZY
 PgUiCuAeGe8D7eg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX/4tAxOwAr3dd
 A8MAyd57QrhVz7Z9zhptgBSl3uyQroMcJdx/ZFAQBikRzxOivSy3EeMsAwcg+9Yos7zq4q5pJBt
 JQaPyt9/X7MEE/WZDqV1QoblnI1lEzwefv8cu746ksIgbm5+j/trIjIBE66+fHtjw5RGvZVD863
 Eo39gyBQ855n9CAk9LhCaLRJ2n+oYw+pMf3jEJ8Jvi94VHq9ZkmNClq7FCRL+i9hYPjRVdAkDxK
 kaJi6fUkkBKTHCCMh8PSEEPamvu2LyIxesUwnIzMp+ddzmNMvPlHDnuFY+EeWWr+BPUZrpnwGw8
 ZrupLWaxEA5N69EBjpyYGp6yrSx/pAdOdHoZUenVAe+VdAy5/VpDISGnlKnMUdfwotdVjXZPYEz
 lu+eZi+wu9TDmPq3oj5wlT/PopVrUfNLgeiFETTSp/oTVtgI4xrNDL4XuJSWKDqOgVe+wR9shs3
 maZMlwEns1QOBuhwn4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfXycnbIzQzd83R
 WqbLVUBCa7MrxKUkESpQ2bEMeLHIf1B3aoRaC98MOuMIL9agG85BtKsrNHyI1w396azwMw/xN+k
 If1LhOkrykKJFKpquXE/myMNjHYDGko=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aecac76 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SLtZePgESXxLFGUVpRkA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 7HzQptt-6oCvMi-WFk6Rg2FDmBhtn_F1
X-Proofpoint-GUID: 7HzQptt-6oCvMi-WFk6Rg2FDmBhtn_F1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050064

qcom_scm_io_readl() performs an SCM call and may fail in which case, the
stack variable val remains uninitialized and its contents are written to
HW registers. Check the return value and bail-out on failure.

Cc: stable@vger.kernel.org
Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 32aa7b919e24a0e614078ddc70a248c746e4813b..0053d1d927dc134ee81377fe480befa2da87c7f5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1117,7 +1117,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		u32 addr = pctrl->phys_base[0] + reg;
 		int ret;
 
-		qcom_scm_io_readl(addr, &val);
+		ret = qcom_scm_io_readl(addr, &val);
+		if (ret) {
+			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+			return ret;
+		}
+
 		val &= ~(intr_target_mask << g->intr_target_bit);
 		val |= g->intr_target_kpss_val << g->intr_target_bit;
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-pinctrl-qcom-scm-fail-3a5a2efa79e1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

