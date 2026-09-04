Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794B4FDE57
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536559; cv=none; b=Z+dyRYXOxyMmthbMWMOpxvf6DBwomSoajmDj0s2Nltna60ikSiklxK/IiiKTVaMNIpMdXUq8WSsIMtxrE64h/06wXpQuVrUv9P7WLhqlmjnIA5+YfpbXZynefIASqRAV9j3Elj57+bCXWvoiwUMDq+WzQFqghAg7nwpm8Ayc4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536559; c=relaxed/simple;
	bh=v+n+nmdFdnTVbNIb0TxN7WMBm2mqsLqLg3eHOpRK3EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXOhE7g4oEWOcwgqsQrlY3idEA0CIqHVIBYnH8JkPFmWHb7ENaNhJKkPH83c86c4mgtJwFziUyRxCKsDp5qUrrSjIDC4+5cf7QXpiDKwgAB0ZJ2846rGTBu+6CjKQDOKuxURJKzwqPFY5FcqJz4pGhlRiFArfiEupmY0oFo8mqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2GDmqUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hl0ADRbb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2GDmqUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hl0ADRbb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiTKp3765768
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 15:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJpihxR8z/RckkhTvBE3C58BSaU7qi/UDpmaSYSphAU=; b=a2GDmqUbUYlfiQ28
	syEw97CMlDNJ4iCtBqfFLCVtd0PsCRa25LknCzyN3oQR8wZblfNI7ssPV+Nd9Ea8
	fCNjAi1KufL8Yxx0I+MUfsA1LzkC/cT+1GA24CSCjB0tAzjy0PtWKH4b2QJqCZNW
	lW5Trmt90lG/Gb8BojHHcnjxd9H/wuF0B34kUI1BAjq3JkypTRTWQFLy1d+iWXn7
	d/E4bU1sgyWQBkzl7e9HJlyfezxw0Dv3kqXgP0RA1hPPXwVl20uB63aaSRA3JVo2
	OBgsU3ZAnlbxjRCkKx4QOXRFZn7xpIrZKAoCHNyNiiISW1xtllU8gzvCEjd3daBB
	odYoTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0120m5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 15:42:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso185676785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536548; x=1789141348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJpihxR8z/RckkhTvBE3C58BSaU7qi/UDpmaSYSphAU=;
        b=hl0ADRbbvESClIk8f21MTRihuSDpZjncSZar1C4k3sunhYimt3QAVM3jkDbjtDD/1o
         ACtDQpuAGUKJdaPx3f9/t6KQPt0HpTCpXjWveZuV1Ka2QzE4dTXqOKQC97XgUp32IOvW
         C2GP1TYELMmBkttq9ANw6J1CjIt10ppgWR3jOk2unhH3lVpqnzX+mB0m5KBLnNOPYD2m
         q9u+tUpWdLljM2X2xuXfg3nHZ3z2GA01E9huSy+orpWn/KBvNeEFzIClyS9R669t7uR5
         wojTOOXLIFZyxyEfTZa21n0XLpUVnRXRyLeMDQ+eZqEiaDoFIhBdVLElZ0CKXHvkH7x/
         htvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536548; x=1789141348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJpihxR8z/RckkhTvBE3C58BSaU7qi/UDpmaSYSphAU=;
        b=pvWx7xqUyeeFYSatb+u+87xwv4olJqQb/O70BjuRfuI57Ul4DX4AClvMXc+zwa731R
         dYOJjLZV+HEtcq3DDXFRgm+sKLWAhMSIywQg1komVbTHebD/baLgffSYz4ttit+Aembk
         eHgLJo8QY6jQwKz/Ha3BylRNhOnbcyB5OKtHskjUpwQuYqul4iV5gFKwcYDeHv1rSw1q
         KKe0a1iuaVbIX+v81Bl4y5PqsSqLZ57WGMaSijo+lcss9L4WMlnT2IQRc7s8u/fyLwUS
         Issz1w+L2emB+uo61tiiuIjjlUBUDbUvusnI4Y1aScHusGzwieV2xpQdlXgRqZSl6L0H
         LSBA==
X-Forwarded-Encrypted: i=1; AKwUvBxfWbQCi110uvzvUPmfErEjh9qa4c9GPcUo+ta/XjrJpC/q3dmGQGngVMoZMz/jHylKf2ba6M4FGusGyQl5@vger.kernel.org
X-Gm-Message-State: AFuF++nZPwj7VH1uyDTvzu/N3uMiPCyoN9ZhtWdrJ5JHJlqfPJuCJ4+Q
	VWbRfV+MuSha1a/313TXd8WoTahUKvkJuU7YGC0RNkyHxtc5sFStgF14e+VeKESyhetwnqtZNvO
	pT4YCujQIMEMGtHK9yJzc+ga25bMOTTFiMWSoS2KL7xjHaDwoFy7sMlIa13CZx2bBnoMPSzILQh
	zt
X-Gm-Gg: AYBFou3w/TpPlQ5f5xfuDWy9pnyeytGnsg/O2RBEbMw5tWmLkcmimRjQrtl4uI3GSLN
	SIVFgqGGCRauP9sbHvzJLpUyiO2/hvKeLgjsWEm0TDY6b7dUFZEdNjJoMorNQzW+CWBwka/zst4
	kuch2bjysRtd4IeunstIHBdQllUM1B8iiUlbRJquJFZqOi/e1eAnxXjbuDnNevqc9Ar8Awx/4Op
	jOkiyvHRAshfzS1s80HPOXw6yf3zIIQ9ZKm7dRhnJkU5KKs9YMZ3WFLnqsoD6nozx5L2JRWLE1G
	xgVjoj2GsMV1jIzdDYm5osRn6U9dothw7jDoUwr+0DTBRka6hKx1KIpSEf240RjE/Mvk9Gay/L4
	AvqyTzcLuhnWclXoMrFhdSHTh6scWy0u2gHyYcGiJocfug2aG0n/FWrC4BKJ0c9+afi4dTGE7zq
	fPBvlM9anPJqngkx9064E3zT9IDkF/qf5TVf6s/gG9FKRdvRuTLeQ=
X-Received: by 2002:a05:620a:2713:b0:939:72cb:bae7 with SMTP id af79cd13be357-93972cbbeafmr868826985a.30.1788536547643;
        Fri, 04 Sep 2026 08:42:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:939:72cb:bae7 with SMTP id af79cd13be357-93972cbbeafmr868822885a.30.1788536547161;
        Fri, 04 Sep 2026 08:42:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:26 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:19 +0200
Subject: [PATCH v6 04/11] power: sequencing: pcie-m2: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-4-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9ae6e4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Wval_j7vKiRkorSqWqkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX2SsLxLQiESw4
 bnK21FmYpJWgC750tO/NuQO4goLcZFmdi5TOKNiMtkOUCLTQfULocFFJFsX0moEh5ADZms9YQZU
 2xR+op7bULf00mjwTSDqyf1SF326DeOR/sKbkdt5BlvACrDIj2BnlfUlJ9aNXop+zaKfGn/TiQD
 oKG6i5Yx9wSQCyiIQrHYOZA7K1UxzXjCFf7lqvg2QwVISlwq1V2vaaZ2PsHV5OV6JiDLk3I3h4o
 oS5776UFqz8zKaMrsyFMDlxOKOdU8gdC77aq8Yd88H31oERIC74X9xb2BD+zrq6a8+51hiBfo74
 B0B+8/8fICaQS5mlNrYe6E5u3rtishF6pxJXfcIgraTf1YFHS1/eXVdq/URbIf0aEgGHdH8Ycg2
 k+Ksd6qmd0KxEn3hscYQPZB0+x+2qd8yoh29MMzj7pMVokCKf9gQ+vFilC9jteaSysB0Bt8N3az
 jsUkXtf0ZxQswzTSYHQ==
X-Proofpoint-GUID: JHwzhfeZln0vYFIYq7yAe3KS_KNzF9Ps
X-Proofpoint-ORIG-GUID: JHwzhfeZln0vYFIYq7yAe3KS_KNzF9Ps
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfXxJZGna7i+X7w
 z5hFzgXNHGcPXFDHC4JlMoHVB7sLoSS2RAMr9p7xfdLwcnflN56oo5skxatD+fbVHuGuo5nztSD
 FaN9ZcAyYbjl41Arz4GKp8FbktyKLoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040143

The M.2 Key E connector gates/resets its functions through the
W_DISABLE1# (PCIe/WiFi) and W_DISABLE2# (Bluetooth) signals.
When a signal is not routed to a host GPIO, the corresponding
enable/disable callbacks are no-ops, so the consumer cannot gate
or reset that function on its own.

Implement the .is_controllable() callback on the "uart" and "pcie"
targets so that consumers can query this per instance (based on the
runtime presence of the W_DISABLE2#/W_DISABLE1# GPIOs) via
pwrseq_is_controllable().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index de9848a9a9f19dba6d2e9d756c3d30f6648738ed..bee1aa0e077db139a52d307890053492b4513db2 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,6 +83,18 @@ static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_uart_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The UART enable is driven through the W_DISABLE2# line. When it is not
+	 * wired up on this connector the enable/disable callbacks are no-ops, so
+	 * the host cannot gate the Bluetooth function on its own.
+	 */
+	return !!ctx->w_disable2_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
 	.name = "uart-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -104,6 +116,18 @@ static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_pcie_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The PCIe/WiFi enable is driven through the W_DISABLE1# line. When it
+	 * is not wired up on this connector the enable/disable callbacks are
+	 * no-ops, so the host cannot gate the PCIe/WiFi function on its own.
+	 */
+	return !!ctx->w_disable1_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
 	.name = "pcie-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -132,12 +156,14 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
 	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+	.is_controllable = pwrseq_pci_m2_e_uart_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
 	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+	.is_controllable = pwrseq_pci_m2_e_pcie_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {

-- 
2.34.1

