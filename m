Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4640BCC2
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610427; cv=none; b=sfw+kIUmyubVPDZUNBwIA1Ls1yY5myjRkLJIRGQVY97E3M/MQHEzLFLNTRCnAAEohosrtwKRrC5kX0MhPSCXBBHjScXjGZrw6z6g4fMWF9KcZvEeM4rSquD3B9LS0aZkVhjN35pMgghT1mPCeJLBikBzf6KQ84hR7ZOxKMrBJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610427; c=relaxed/simple;
	bh=ki44rZqsHENfxwVaIlWsw0mriK3sPfARHJY4IeNij7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cs7oL5nGSzFuJJYZgzXply8gbJcN8Ok7fAV6tyK5XqnDYm+fuT9ytIaZejnSmHSEy/zF8Iw+w/Pg3p6JV7AXYKtnTgRhP5sWg3UGRcdhDK+ChwWer2c0TG1e5SjTHEDAmY6nHEt3OMLPR+yhdkYNpO6BqRyF7OAarXhexyCRyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE7LAYmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWDjNrHX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE7LAYmc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWDjNrHX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eYPY3439444
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ihzh9krNeTK
	98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=; b=YE7LAYmcCTo88TujnZaF+ZJ1Mrx
	X4sZ0y3CgpXlxtyvyse/p0u67xcdLMMH13CYJ+meD7Maf7whpr/87TBoaK5NBXdy
	5dxahD0NmjQuCoArfxZoCxjlz18fyCGQfO4etJeaf6lzW3luJlqIzqaXKUSWmi8o
	NGfbwk/tnWeZncbKYkJJkMVDb7tUkj3xQuQzug326MQOUCKqHsHn/nR4Px7Pb1mY
	6HfXLuxthIJ6AqpG4HoBboezVec9yI7q1/kPQr4ZCm9NlWE8Wu6BAbqlW3KftTJV
	/YhyhAKwqHp0KhzzAzEmoOhEDStbrjYh2FErmjRUR+iE/Bi2FsIEBiQ8oLg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmrn66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:33:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-887e45c7063so275449b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 22:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610424; x=1792215224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=SWDjNrHXMiemp36yjHdSBW2RwcN7eJ25Qxipx6uBUzaLofAkvn3kImAKTfGSkfXYAD
         QsR5w1Jk/fcqHPoqprwajyg4AqyAq6llPdx6uXO6EddtdS6cm+OAY/22af7V6PDeEe89
         HNvQdsCQC/Ba+dQmkR1o9gxdmv8QmbHrBV7Ixr+Dr/jg4G/JDXs6zwqNjiCOBUaXfuXz
         SzCb7gd3GWFTqQlVutkhHbJTAZVexvP5WirvWrSe2JChaDun4WfRTg/x3XGkaAezVMtY
         O8CiW/7rvB1jVJw+N97Qyqamv8QoXd4ChBwaqTIYkbIbBOiWLgznAHXh8m6Pzqz6563A
         BVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610424; x=1792215224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihzh9krNeTK98IzARF6nI43bHHUpOUKcTQlAoWpm/DM=;
        b=aDdjj57L3Kx2Mbc0qVHVRHOA4fm0xdsGfeQGY3sMldKXhPAjCnF5f1N+oIH/w2FeLE
         0gSq50J++QcyuwukfseZSkdpiZRrW7TAQNJC/J7tqIplA5M98j6P0OFtMkIfGeL6q4AP
         SAAUfEIZBI2deWi+MS7t/rJ8mL7iq6V1IC0wtlVgfjXRLuB8On7oiO4Lec8/jbPdcpj2
         p9NTs/0ul8YN2G4muNkMemdNEyuGjLDmqFqKHXx01voc3q44YercdfVuTQs6JmiEv+qr
         JG3c/dt3xn2TUzJeBS88dqGL9jtdKh+jfmtCagIQNH8MMuEGtrqswfdh9srkhtdvS4op
         0+XA==
X-Forwarded-Encrypted: i=1; AKwUvBxKFRLcwYD3ztbMV09OcB5NrTqXdxhGNLkN78YADzQ/++/KS/H5IRqxgUXq6+YM6GlPpiob7z4Ln45rVNrv@vger.kernel.org
X-Gm-Message-State: AFq9FYJKAFgjpw6F4D1rR9MM0lurbZxjuygiNDcYQIUMtzkjh1TmI8ef
	U33Wv13Zzvj8cmv7aIAm5a4J2dzxEwgACJlnCtXDNA4D0b08qVBVqKq6dPQrVkYPz+RnxgksU+8
	Y9aaxfLvQz2tUt0awY7ku00KqVRJsnOxkUOJJRbPiBrWuCCUcnlx/11cDI1EBVSb0Myuh
X-Gm-Gg: AYBFou2oBWWxwlng8wHH06goR8ySJfMlXyNrVXyNU11QHPa/+ju0Wsl4qDn4/UNPFqT
	JrWHBJoUYo7B9PCihKPccKKtMq2XmImMDkTzWqCRQAdvqDYE/1iOZK3WZiPqUwVVerOWXO9p4sS
	t2NBVKzW2mLqamg3f8J43ijRkMFLdxBjSofqfiGnUIL1z28bOFtgBDf5/HrLhvFyV28xNLPU6IV
	bEoGPzFVHWnreekfDDuHdL4+Ita/POVvUmPfo6GQvImShAR7I9fVceZ6KSrmaMI8D9uP71Wj4BJ
	I55uggWl+L5usHdz1DZaGNpDOA1uuNiyJMc8oSaibjwm6MuuTPnpOhuk6vv0lolYlpteHSFlUku
	Zu+Z5bkPfsetruIy9B7lVbpKFuaKGm8c=
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr3405931b3a.45.1791610424134;
        Fri, 09 Oct 2026 22:33:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr3405915b3a.45.1791610423647;
        Fri, 09 Oct 2026 22:33:43 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:43 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 7/7] usb: dwc3: qcom: Enable VBUS override at probe for default peripheral role
Date: Sat, 10 Oct 2026 11:02:46 +0530
Message-Id: <20261010053246.2991984-8-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX+dU8glIBR8ni
 wr/S8DEvr12LITUK6I7h+6oFEkaX3gppxukreFmdYpngO7Hkx+D9SrzdAsFieVIW3aBwkL2WHKY
 4luNlL0Ix512ZWzHq2BkBK+kfmdEoXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX6Yz7FBPwEFUG
 tGVu+IZ9/0oeP+O1nqZeIddyb3xEoFqry2Lgmre/5nFNULGFTmC+AJLB/ZEdkKJmyhp9ea2Yvpr
 FfmfgcuShCUjXWP78u/uhcOFESfzmntMKG0w37zGib70jrqeVxQwBflUhnO8TWBdzcc7zNQ/b0D
 z2/BRG2ZV4byQtum0Me7chfbo8WSTRKKkB9BeIEMZDV7giHm/ts3FD+7yxsHS2httWbIVWVwq8v
 VR8TgQBbPuF/9PMB2EMB1UOE4nrSDChPMmVPKdzW2qUbdIVQuYYZG6PjDKmr/K6PNgc3fbo54jW
 qwGSQRDWdHtmrxGXv6Q6+IHFLLKpmlvznI4DzyOqr9/FX+bnQ13HrUmF7tos+3astNRWn3J5Uw8
 zchW7NyS17x4Of+MRHRrGAyqKGAp6FjK720Qmy3wL5GHkBo96A98jrhTtKdjaL1bJ6Tc7M5Z1qf
 /44cJGXwBzxHVDL4lsA==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6ac9ce39 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KL4VWcfqKbbHtFUGL8sA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: LpdnKtURO_ff2tLPACyhpxMQ9vSDBAkc
X-Proofpoint-GUID: LpdnKtURO_ff2tLPACyhpxMQ9vSDBAkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

When the controller is in OTG mode with usb-role-switch and
role-switch-default-mode set to peripheral, the role notifier never sees
a transition at probe, so the QSCRATCH VBUS override is not programmed
and the device never gets a session-valid indication.

Enable the VBUS override at probe whenever the initial role is
USB_ROLE_DEVICE.

Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
suspend/resume iterations completed with no failures.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0896a323bdda..92f1223f7b21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 	} else {
 		if ((device_property_read_bool(dev, "usb-role-switch")) &&
-		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
 			qcom->current_role = USB_ROLE_HOST;
-		else
+		} else {
 			qcom->current_role = USB_ROLE_DEVICE;
+			dwc3_qcom_vbus_override_enable(qcom, true);
+		}
 	}
 
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
-- 
2.34.1

