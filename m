Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D35012B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982998; cv=none; b=q6e3Zl/zndGOD49zSOKArwC0cki6gB3L3F4Nise8enzXZO7J9WGF2Gi0YS517Nge1YG/hbWM3GvaOXH18BUv8nQezZLh7ohi0QIyJ3Rz0XpzYLnwayvpyOm9dQLBlRvT4Elv37Wp1crktNjQ4naZVAsvJNnNcPqtZsOzDDegH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982998; c=relaxed/simple;
	bh=o3CLylce040Uzmfs746UWO9V4mjo6gjq7klcNZMuAik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1w7c9pCtaS9kc/g5+kHxa6h33jj1K8fhNvUcVei2RF2kW8oee4BBb9vKTpiMdJ81LH/ZVH+Da/pdG7npxEDGGrec6Lt8LYFR8VIWIF5ZC3KFFw71fA7evarRmDKpf4S+lGbnKbXpkVaG9+kDtMuaErE6HTQvr8bSe7CtoFbC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqIEWlTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfhcwsVZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqIEWlTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfhcwsVZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBImDT2685314
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=; b=NqIEWlTpj31oiWxd
	VyDcdIJj8hN4vD5SJQx92tB2Jj0meGvtc5ahP2salRE/mmW3MQAtDCcaFPJTdwJr
	vIvMOXNk3Kz742RCCT+YsYQlm/msQ4yqYu3RtVaa9oIOlEnzNzSZcuXAbIwkSGjm
	c/ZG06+0CuS5FFLcSn/Gl20RMvMhdtrZq0nNhM3fLab+kr7p1KTTcHssRanQ91Mb
	JdQFe1QiICXanOb2Gn4u0na/EKz7jMblM30ADgHkEYeiOy5i+GR+PUuCbCNvz4Ce
	arYcjFUwHepDgIcFfk5j/lG8ekSRfJtixneLEHFz/HzzoDsd1RgS4VO/Sm8bwPbs
	qIve4A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1ns6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5db39f9a7b9so5011433e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982990; x=1792587790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=;
        b=VfhcwsVZ51wdKvHK0M3aldmagg0SB1fF/oZXBamuodWQn6Db4HB65FJ2zzK6vXRrrq
         nbo4S7a1JwPi5m1sv7PGVM6sRts+W4H+78+WcyzokIPOBDWSsxNTVZKip7pod23LkTjw
         K4iv2KIe4SZUwRxm1HHvzAM+r+dqI+DuB4lS8a1I5OArpvrfcTXCi/MiibFFq+Ch6/vv
         b8qHGIBbKeKj+w6UVhIgcKbn17u+3Gm8rDhlf6JdYimeMQjOop7X8/42DQkEZ59CgFJW
         j1hlGNXHA9vU0wyJHierGiOirB+tckTUFCpZ2xi8qDBxK49SnyVCeedJbtRIS9VbxgA/
         kVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982990; x=1792587790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=;
        b=w4vuj7RXSArxzkUkhFZcOWyTJXfDYl09PKqpmgRgZ8ui6jUuOyaRfVxUmBqzXsbO33
         Pr5X33gfgc21qzb8yyq8XRlI1scukZFAxtUxBRtksC8akeOYDcshqeoRdRbo1+XCDsUz
         j4c9vSiTMCBIidg0FTf6s0+uhHPb46KWv+I8jvis1bTiLWtT8yqgdJUuOS0QVDHbt0v0
         7yzEe/LerF2Q9en3+lgnR0O5kxT0kGsmcajbdodr0F12X1hksWPvoSqIH0cMKiYrEmLn
         1hRGTfAmg7fPkoZJfgEZLUnmj+jB7ks495yDq4XJhSDJkKspaiHIhaqKik3J2ALg9ZCF
         9ZlA==
X-Forwarded-Encrypted: i=1; AKwUvBxkcgMVcMymmeXU3FF/95IJSJIlLKBIl68/mDRcztSUWofktyv3YzuxhUXj18Z2zZi2H8SintaMXlCi6YTH@vger.kernel.org
X-Gm-Message-State: AFq9FYI6UUJL9dHu/FTlGUGI2hDArqxeiIfI62r4C4Zf4DwGEn6YnZDG
	2CezVEguGfJlb6lfrY+gXfvVxmWbhqwzJCGqqE+LrD/axbPguQjc4M+N9em73Ow6rT8x/rIFAUx
	ZcQ5LGtjFTD3kKwjzePDCdqF3g67vGIN2fkhfwtnK0KfA7YzuN99n4YWVh/Gjb+JLKksf
X-Gm-Gg: AYBFou0gEuxw9+0GelYjdD1kluNP1Vr+XHvRxqfPje7Xh56vh6H05mS0Fq6Xcvzegsv
	13ouk0Zg7lS2BFA+0igS9PfJXwGtxjwHuATHKKWHmPjgLgiGjgw95J3Gb/U8qzT/8xxFPDtu87B
	twwQNeubCPFDzemUftfkIyeV2LfYlFITCMcEAKj2bVsS0RsDGQHyTYp9csVIrUPs/eQwAPyruw3
	Qrx7Rn/PUC4g7e4wMMD5ZfBSk/amjpL7y4rStiUFDJK6E8ISEmePmS7TUM2oLmxK0obCLPACWHS
	vhO2I+66kh72BqKJSEXHSL2OWg7Grc1AT/q91NXzK5Kyo9v3h2UaMoEvYbRk0RV2ikRXX1UpPyF
	vAh2GverQKw==
X-Received: by 2002:a05:6122:6004:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5e91e5b32e8mr2980462e0c.6.1791982989274;
        Wed, 14 Oct 2026 06:03:09 -0700 (PDT)
X-Received: by 2002:a05:6122:6004:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5e91e5b32e8mr2980426e0c.6.1791982988613;
        Wed, 14 Oct 2026 06:03:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:42 +0300
Subject: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the
 firmware node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=o3CLylce040Uzmfs746UWO9V4mjo6gjq7klcNZMuAik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz318DQUQZj2g3zPetmcXTmEY2JotdT6sE/6vQ
 tfCBrH1k8mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99fAAKCRAbX0TJAJUV
 VqqnD/wP5JoMwF0ih0vuQgLKP4VIUS96MyhSknO+sjN/Q9Q0BrULeCLswkUyfHTEpsR2Ck1Uevx
 Da3W8gUrShICjvJ4HUdEgOa3vej4kDHzMvVWof6koUhvLnFoeTP6gmyuaNI0e46aFhaqsOroVgu
 yQUVpu5+grq0ES9g+Rdz0Xp8T5sF3iU9Pr9Rk9xcZhZc7hJFdjeriffHikx0qswUGhg3dOoKIHd
 dOIdJAQ9H222ZSuUCOSyTLItTNs6lOb7vDo8OnLIfcakNC8Aywh9AZZnjT8va7G2Rk2DAoDwVYa
 iTesV0M+K/CW5ek8DOSiCwfOFx5cU0EoQHRQOmphakzLzQsU3nMV/gKmgbUeLkfUum2jn8z+38+
 dvu+0FsKanxH/fzteGSNH0QUnTYIDO2vI78BqsqW/RwyNl9bSDSspaisBgbzLosu/Avsfg4abQ1
 M2oia5hnYq9HrYApIxBtivHJLVD7D7tPAu+TFTKW1EDLIEsClDug0TspuRAwpG7/Dw4ZmVX85ok
 4afY1xGZXXvSjUU7RWHD9j+OpsLgz/JK38pL/bB3wPI3zlAvmSI7WAu1JcHeluS8AQ8bjbZf+m+
 JTUb/Q4nAq8SfY/7o9IgJH+rdO1XZHPE0WaglSCFiF9X8S3YGz+t9R5y8HtRu7uuXBhaw/P4jo7
 vnrZnX8znYCQtRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX/ch1HAzcAzWr
 Zga0Y7c1d9hG087vQwT18Az/arHzyuabz72/eaAerR9pUSS//KpKwSnjcVoP0cB0iy1Yc351AsQ
 Ka9bEW8AyZ5N6aD1Q/b/9vqn/Q4cQ5w=
X-Proofpoint-GUID: EX5tlcN3Hp2E-P401gmk0F-9cGpn6tpK
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf7d90 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=miyTlQIDcyHKYiHs0IUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX/0JpZwSbGgmg
 rNoBMII9yLonXe4i1dwzEnWDvHM+dXC8GaDVlF0qocghn9Pn53xsw/uD9aexBOsTYiQWPSel6E6
 GGyz4NaFjNboWr5OufgP4kPJSTtmiETNmPUiVvoWA2PcLyzUUPeF63sk0QeCQ12kCLldiXl8fSw
 Mj+QiH5PTtbEy5CVo6ldX+QYPGfKsqqen4bFkRByxZw5AT3tGRqzzBbi/RPdmOAiQWJRwHhL11d
 1rJGlg0HO8lLbF/H8OorJplp+CQF9gYSf1vxU/l9RQIIf5wP0UEduaUld802OQdA5a67zSzCexU
 VyU4OeDKRSaGvPg9KZOKzI8xDLekoWsIs/cJg+et/JYc5Tu2CSS3q5x3Z4HNktwpMlZQ9r691ie
 wm9p05S/yA69UAq/quCi2wqMzhcckwicBgc8KuYyCndWE/JPoN+ims1XAs8a7jf4OeScf6rf89t
 +Bt6peEZt+DiVkxOk8g==
X-Proofpoint-ORIG-GUID: EX5tlcN3Hp2E-P401gmk0F-9cGpn6tpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

Read a MAC address from the device's firmware node (a DT "mac-address"/
"local-mac-address" property, or an nvmem cell named "mac-address" via
device_get_mac_address()), and use it in preference to the address from
the firmware board data. This mirrors what ath10k and ath11k already do
and lets the WLAN MAC be sourced from firmware-provisioned storage such
as a UEFI variable exposed through nvmem.

A device tree / nvmem address takes precedence over the board-data MAC,
so an explicitly provisioned address wins even when the firmware reports
a valid per-pdev address. An all-zero (absent) address is ignored.

Note: the provisioned address must be a valid unicast MAC; a multicast
address (odd first octet) is rejected by nvmem_get_mac_address().

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..f4d2d0377c8e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14878,15 +14878,27 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
 	bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
 	u8 *mac_addr = NULL;
+	u8 mac_from_dt[ETH_ALEN] = {};
 	u8 mbssid_max_interfaces = 0;
 
 	wiphy->max_ap_assoc_sta = 0;
 
+	/*
+	 * Allow a MAC address provided through the device tree (directly or
+	 * via an nvmem cell named "mac-address") to override the one from the
+	 * firmware board data.
+	 */
+	device_get_mac_address(ab->dev, mac_from_dt);
+
 	for_each_ar(ah, ar, i) {
 		u32 ht_cap_info = 0;
 
 		pdev = ar->pdev;
-		if (ar->ab->pdevs_macaddr_valid) {
+		if (!is_zero_ether_addr(mac_from_dt)) {
+			/* A device tree / nvmem address takes precedence. */
+			ether_addr_copy(ar->mac_addr, mac_from_dt);
+			ar->mac_addr[4] += ar->pdev_idx;
+		} else if (ar->ab->pdevs_macaddr_valid) {
 			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
 		} else {
 			ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);

-- 
2.54.0

