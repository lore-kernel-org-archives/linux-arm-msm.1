Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634423;
	b=X6tTCXLe/hhsjf/qL5m94J5llT7BjDBV/VAUGxNOAxPyMVqGdq0hr4DDyHT0M0baQmkY
	 jVM0/gi2mUNp9wQIXBvQQuRAaV2RhQbkMgxc7T3jI5znFL8Gx9RulisMmO74dIGqXSMzG
	 krRHC9gs8uNYD76L87Kcf19/wzn83NZbO81Wn5btdFV7t0pDnj6ICjTVbEcur1Nq43Gip
	 vPHDPX3yETz7lAbaLuWUfSRCr0ajFQ3KKmg80LqKZpLs2kvqsvdLGZu321xQvlHSharem
	 qKadi+gTp8ruhOui0WMgJrjujo0cvyQJUcG0gV6v0vqyXcTzNXQwUdsbQpDAtAiqn1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qvxyFfT+1WtcGMNXj2kJ54v/fT1oTx7k4iipSG48O6Q=;
	b=VBk5srkzbiXzup2kf9mXd6DeQckc2aOZ0yFHN3AmKroQO3fkBGu1J00DwMr/Hb7Qo0Re
	 DXRuwOyBhW0a+iAzb6kxAE1a65V3iRmZRHupKztXqVlTSrPTjNg3X09xM52nPf8hO2tpM
	 ZASXa+TAeFVfnPrwZ5Lf3Y0hmebauWaZDFIewVFSsKfRVsft1Aurm88dKM2QLXt2xq3Nr
	 /W7ENg7b9MIgzsY/cKGYu1kPUqpJH4AEV01wuYDLSTZGM0XmQfajKlB/HgRYhUdcKUPVg
	 V4sWVzro60zlM7lhxdkA09IaBXx3TR8GoswCOQmkpfYGPFB7aijvYSmqqQ8PshzsqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PvOv0C49;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYiBPTYR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64C7606B1D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64C7606B1D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PvOv0C49;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYiBPTYR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIV23102577
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qvxyFfT+1WtcGMNXj2kJ54
	v/fT1oTx7k4iipSG48O6Q=; b=PvOv0C49IDBAtPciWNGjrm5Uf1qGrFsXMrYQrA
	vaPBPJY0CnD94OePY3ChK9jQ6QbpX2b8LGzyzb3UzxQZ/DWMYJpwFRsD+Mxlxkon
	STuU3vReHljBTPoTUpPnnlqP9FK7AcR7/VuRit0ONZI9fLa5U29kaJAG2ABfcIwe
	qF/nBtOlvbwBUpr2B1Bx5r7CWmc8e5EGiL7CHkpN+k24tv+ssUcFOZ/CGJEASI3p
	78PpbeKMisrmWdJMEpemmbFp0vqAD5cciSF8huHi9pGNzF6eZ3GzcFjnFEh24LcN
	XHy2BVZnGW+8vGdG39JkMfdbhmSX+RLWKAUfMfeaAJOSW7lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjms1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:47:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so353685285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634421; x=1794239221; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qvxyFfT+1WtcGMNXj2kJ54v/fT1oTx7k4iipSG48O6Q=;
        b=WYiBPTYRaBZEU1Pfo3wd6dGxK7ocF43/6hpcZ/jvhv2dSSIX83a87zhEnGN5PDY7Db
         5FXWJUNFnr1GasHqbnRHNgYPZqBcP7IOu9P0jFOSG4EQFEKRTAzBckBOV6sqbXOd9qqT
         R3+AimkutQbkfu8RVrNEOFG18e5Rm8qciKVsNyhx4IdzCXwrmdpYXD75+Spgv3PELFQS
         GsSU/nszE0tX9mLBW6Xh1Rt3wIRwyJ2G7K0GTS6pGqm0FA8fEma+BXvx8EimBvYJZDQG
         SyQCUtVchouha1JEWx8qWWj5cR5GiEjfIoDceGOBfXKFy38ICHe54k2rWY7ni6zLVCDH
         +YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634421; x=1794239221;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qvxyFfT+1WtcGMNXj2kJ54v/fT1oTx7k4iipSG48O6Q=;
        b=uOeuFzMQuZSkGRWAQ77L4N0HFwTY6I7MeVAJQZJTUGmTf3bktZeiY3i9UBK6ZFFQze
         HdELIIl9FDfQxzDp2MdAaBJjjAhWSUSn2d3WvVX8Vo6CI51Ai/fbjmaxjPbM+19DjDhW
         3RJAisxZUd+laXKps1CuwRnK3z1zKKLKmaXcdXlXfTNqmMUVQxbSB9eRSm6a6uBzkPCx
         +u6d1bJ/dXr02MHjTxUSC5UtQtlWua/DQ1YItK2jHHnyLBFO1FiDFGRcBgrYX3ztj4ty
         UNEmMLYvDS2lYtOdpVkchdNZT6W1TB24S91xM/fCIibIEH4luwhUc7rZn4myo3OOB2GQ
         3S8A==
X-Gm-Message-State: AFq9FYKOKxWgrvG41jXi67gzrSK2LUfqF1pLktcCjDiF5qvc83Husv3v
	kLOcU1eNOvTbxzf+081fT0e0+UFwEj5xOqUzMUT17FO6Ra1BQ61qiE0gNYbA5E8/7/8N1UQSX8z
	va5Z4smlGoVa10NN3h2s/4k5mRtcJhWP14DOVvYdJr938ZRe/Yz4+3aHsMyE3HIsumUTA
X-Gm-Gg: AYBFou34b9Q7LCCe42mUvzx/NzY7okNka7XI27ohrs9l9CdCqdRYEAv2wVCN6Y/+MDY
	1K6F//gJUCAIQ1a/S76JA4oTuTC6zGtS3NAbkki5sS829qHHYs7btIouuD1jpyOLLiu2uh4a2VB
	3P7Y+j5qgkA+qns8oekMYnm6Ou7CXpE6GVJMBHCvFmWyMiVJhuwtJnbngrtQNtxLh36UVXgFWTu
	RR3vzUCnbJAUGCRmXqyM6RSvc5O2gzneTus+BPTT0bb1D75FKh6qglZWsaNesm7vwbMW98vK9Pp
	pku3pb5GUuIGQ6bXlNPrCZkPGBeO7sML1O9AGCMsdJeOipWfne3FyuAE9zhgU3O+mcrz7jIoG4W
	K//vIvNXQuMccw0RvDnpCpZIP/cffeQA6sRQOQtryFfXL4TggrgcOqfqO8w==
X-Received: by 2002:a05:620a:649a:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-9442174f31dmr1616363985a.57.1793634420974;
        Mon, 02 Nov 2026 07:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:649a:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-9442174f31dmr1616358385a.57.1793634420218;
        Mon, 02 Nov 2026 07:47:00 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm398196295e9.11.2026.11.02.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:46:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:56 +0200
Subject: [PATCH] spmi: pmic-arb: Fix the driver data used by non-data
 commands
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
Message-Id: <20261102-spmi-pmic-arb-cmd-drvdata-v1-1-2e5ec8035b85@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG+w6GoC/yXMQQqDQAyF4atI1gZmRhDtVYqLOBNrBK0kVgri3
 R3bxVt8i/cfYKzCBo/iAOVdTN5Lhi8LiCMtL0ZJ2RBcqL13AW2dBfMikvYY54RJ90Qb4cAtea5
 c4+oK8n9VHuT7az+7v+3TTxy3OwjneQGcIRYPfQAAAA==
X-Change-ID: 20261102-spmi-pmic-arb-cmd-drvdata-fe9a1e308063
To: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dan Carpenter <error27@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=T7kfTC58UyyOEU3z+I6l/tcxF+983zx+bMBW6NyeQFo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6LBx6ofZLDC4wtLxTu08yJE+9/KZRYfs2i5tV
 BeyyszFsC6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiwcQAKCRAbX0TJAJUV
 VltHEADHHunqw9s84JXtkoZ70RQ1HUgKC/k4wwLt2i8o572POqM86BX5Y3Yph4m5QjG17c9TGsF
 6m0nuPyhrzHf25bFoXMWKoHi8Lo6VKqpYjtvNDoU7kcO89P8gpdsGCJ+/73XEXarCHf2FmvmXZV
 8A81dJ1tY8afP2G0nvCOTdVrsJfhlkvyWwsVxkk3gX+paYLl9ISGpg68qPIeGO9uSXxRWkSmChi
 dpCojTAbm1H9hMeQ6/bmL1zMOc+LWTGkjBTYgs2xSDLy9LjPxmBizZ5TISgvTj7dkYtfw8LERsz
 QGYTqb4qyP3al3jpvcfT2gbVGDLgXsRyH74QBVzdkSV2WcAuDBL4vd+t/bco1gC8hJLxMWx7KjA
 tmRnecQ4dI66M+H/eaD0TILgnuMeRWYIAFdRc/566dkfDSKViw/XiRIJnn265Jpcu0YKNaF4IKI
 Xc+IiAQle9Grj43Gi2W2EgeNi+jIZ/oRS5IcRvNIWT+tDUgkriLbN26w9yEdHhdzDuHfkQs7A2B
 uYfc4uKNDAnvmm5l0hjYnH51lCLuUEKazz7RlTIB8Hck2KOu0phvexIdCM4oj5lsRV4D7tihpXf
 wmQ4kaOwd3CuLd4Orzxe8qeJY9dqi39qx0v8yLrT4jMVWawOVHD3X8BaEKy2b2vc6olxLGCspv1
 pLmOhctgvhScp0A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: nL7XH1yiVjZOYRajIUcjeu1upZEklFrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfXwmCkmU1Vr+xX
 X5bAfrsDaAqGBH+6Z33L2mFlkzZKIuHHzmIxf/zSfGejyQTKza7yZsEWgTsSy+ZxdqPUA+ENfkE
 cuWhn21dHeySuwSvGDQmwzlqeDqyFR09maamR61HHIp4n/Ec8SmLsSbqdqc9I3LrpuwGHoGlLCJ
 Ku9w3a1dr+FTKrJE7t7O6PC7ZieCL6L1dqzhXKl9nv6LxY0NfQjqKMsCHT8/KS+Ss9enihnlnKw
 iP4U/UMSUj5G0AJER0awlFfIcE6t4JIibwrQKGfFF7EIIkgPd8YlB+Np58lsvYaewc05gmaUCry
 aPxX3FjjM3p5CIxq6QZCFxO6a80P3Own7Mlkfjn5ilC5yggv6KdeN9UmyODVBIoKLQXsfH2KHVJ
 mjR0mBPji1hfn1NOqZ5wQCN/UnErpa+mtdEtyBs1nSObrTYGh4Wd/jqaX4ZRF4ZzQIlHEAqUWp8
 OuHY+j9FAZOO/xpHiiA==
X-Proofpoint-GUID: nL7XH1yiVjZOYRajIUcjeu1upZEklFrB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfXwSUu+9F0L/z2
 a9Y1AMwEDBuCPjqwMrufSp0UsMYp3M0UKAH0S2ryys7yzaGRYo7k/CApJJ8q8bQIfqpqSPo4LM6
 JgC9vxuUAe+gjih3FdeL9vgLFbLViwI=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8b076 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SMQwI9SyXOPf9XZ8ltwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020062

Since commit 02922ccbb330 ("spmi: pmic-arb: Register controller for bus
instead of arbiter"), the driver data of each SPMI controller is a
struct spmi_pmic_arb_bus, which points to the arbiter. pmic_arb_cmd()
was not converted along with the other controller callbacks and still
takes the driver data for the arbiter itself, so a non-data command
reads ver_ops from the wrong structure and calls through a bogus
pointer.

No in-tree driver sends non-data commands at the moment, which is why
this has gone unnoticed, but spmi_command_reset() and friends are
exported for any SPMI client to use.

Get the arbiter through the bus, like the other callbacks do.

Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-29e1d31a-8d20-42c9-a5b3-41a90553d799
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/spmi/spmi-pmic-arb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 402ffeaff8e2..9ce404ed5272 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -448,7 +448,8 @@ pmic_arb_non_data_cmd_v2(struct spmi_controller *ctrl, u8 opc, u8 sid)
 /* Non-data command */
 static int pmic_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 {
-	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	struct spmi_pmic_arb_bus *bus = spmi_controller_get_drvdata(ctrl);
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
 
 	dev_dbg(&ctrl->dev, "cmd op:0x%x sid:%d\n", opc, sid);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-spmi-pmic-arb-cmd-drvdata-fe9a1e308063

Best regards,
--  

Abel

