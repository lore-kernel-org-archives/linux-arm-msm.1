Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076744;
	b=0X5eQR0eBjYpo8Iez0IEm0v2daFKU7oeef2sVxadS3QJE1MX7280QR7qggbE1hqqOqGo
	 nQkLV/kS4RKBcnDwCYulyR7vL7oIuHpI01HDODjbr1pHbjPI6nQwmpMjqL48GKNeEevzp
	 +k226CsYV30DJx+dEHD4IakcYiai6LGO4mluUxKsRznRDAgh9Z94/2R3/QURlWeIp+PXE
	 8kPlJeT2TUOwlUjogxcm8N7BKOYPmoARe+4rXhvxCVZ7JLbqDh1EIvp+3YhukBX5+qnA/
	 vAKHkZIuEIblZtCd4XKL7TvrASzcmK9uHDB25TAZJ9GmAeWhx2KRy+Gh4R8QOcdCXIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
	b=cHex+n1H1V9mdOhn335BTHQz3BgbJcj1VqJUKcdmQe+2fwZZmKBu6KmWN6diHCr2aa07
	 X6WxA7pbPsLB0EJIw2yUvTJdlApOuuxWIH+9zraxxFOXI2kkdOsNfTZEHF+4Bce/9QNg5
	 eULnyx1Jv+SUBArYhhZt234b8ZSTUzdGlETxjGIPrF2k9hed6WgHVboAPb6tHerVaJNxj
	 cB0iv0K2bjyMn0c7klj2UFpyaIZtQqQxNISEGKid1G+C4km18JJZEG+MZmYM6OD3iiwv3
	 VN5VOrH3ox5XEhU/Wfe6cmNq0ruga8sT2m0aV5XTdVLfGkIyv+Kh2BwTj8Mp/8DnsUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mPuY6K5Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVqR9uLZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D833606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D833606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mPuY6K5Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVqR9uLZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vG6G2935595
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=; b=mPuY6K5YwhLhWFCd
	ypMLasoj1giRpgz27CbUY8eWBx1RhMyx7NlkI7M6N/x796uKaSLQgL3X7FlRhho0
	Ih2EfyOI/JDYa8Er5upbDhth/RdEzQA5alPCgX5YktVnAPpELsTp8RU28WIbelYq
	8BGHtkdI224Jtv86gtCym5yxU6dQbjVn5vMHEm4tSRP1IjN4ILL0BhuA1tCIVBbl
	JpWMN1OBsR85Sq8kzLKJPSuB0mlLeP7+rbK2cTczQlCxOm7Rga0F1buyYJSoosvu
	UNRclSDghyi2vmtMe8Pb4qfUk0ilN1OQwkzbusVyk778cP7up2SbC8gRFTA6LV4s
	0WrtGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekchv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so354667885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076742; x=1795681542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=QVqR9uLZ77lEfWtUXtmVNE7tIxGivYfwVivxvVGtk4aqRIjHyo3X3VLlfPLsGfjshq
         ko+ipYq6rQKMv1I/+yLc1gumK9HVyRN/O6JhjGfLAzKxcBwXNXI1fnLLK29O91PRJyGO
         wJiKdRHSIaCZreHj8mWEHWuYDgwCrKfBcAnpBeMgOVTkzjY7oMCL/9P1P5xktY3VUJWc
         GV6nwj3ydkONvbIlGpPWmEqtrruX6rvqXf4HnEKMtuC7hn3BPGL6gHj46QhWA/o5Cx9k
         sJIx9vq5lcNqEGxvgoxda4lAgtghvIlXfHVM6tI7uFMbthb/Hv7FxGSPEuqi2lEPBRtz
         FnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076742; x=1795681542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=0JY44pJp+AjG7VYExVdDZC2SosR6/cyK7QizDg1Hzb0PGqt4rHlDN9ieAUZafIOyYv
         bNDfrcbP4OEixid0HJcZ4NzSkkNI1fUbzW4EsHvCIN7Xz/sJsgHUGmqKpD2N030o5+xO
         tDWMzA3rGxRtcX/VzV494tIsovxDZHtc32Erzfv/zkdECFuRyhXNsNqwcKWRGepAfYon
         KnllwniNP4hzgp1maEJnmw0JdlufcP/RWJPOOHdft3HFTyVEqxBwoGB5MRJ96aIHKwlz
         IzE0DE/mBSHHS0UeQ60bV0eV1HrHU+4++DXsNd7NXnExjkLH+G4YjFj3H2dLH8iTjZ5P
         gwqg==
X-Gm-Message-State: APuU4Z+eOwmRwOKHyr5QfIfdikN1vLitOhXCoqNllOTGUyqDb7owAONx
	VXAeMSLC/c6AfXRzSqp2C6CQpYKWhMFl57a7JfdrkQe47rn+xHgfd5t9TDlcU6Xs0AUc6NNC3ko
	g3XvJ5tlZnLblCaI6zkhzkS64SvHS4lGFCs5GHO5ht9dnWWzWvNmHapVJgela+2nd/Qke
X-Gm-Gg: AYBFou0TtRsd9ACyU5hWrXEng4VcP8fgtgDT3QTjRcMb+xV3Ku4tBJDwlOJwierAy4p
	R0dCqEvPCgwHhR3mQjr/pumECszz4mTbBfvtSpKEeo5QG1yuoeZIkFIg8eehbsaLmqz3ivs4jBM
	UhxTdHky7Yl1PTj1as9c2/boDIWVO43XaG4VC/w56fCwTZN+wyn9NMf+hbV2sPYpUtYKS+Anhcy
	u3T6AKTLNr0pwIw0DBTh+WbZzlu0AoL83gcgpCAmG4VCNgt2PwDGfsrp66MRTEC315gRh4voLok
	7sZcfS5YqY7bz35mQ4B/VsJN4UTkDRhiekYiXdiHgTBNCfQVBO1mH1dsvae1nISmJPcmXWVNcfI
	8wxKOPO1BaxpoVwticDpIuVO/fXXdz92gjahsNOTXqHRl6EHr9WzaB6mcIlGX9fnJ0nO5Yl9crw
	MVkmF446LSbJgnsNgAtrlK67SORRlec83fta3W
X-Received: by 2002:a05:620a:7005:b0:949:6898:2e4b with SMTP id af79cd13be357-949996fe1c1mr829347485a.66.1795076742528;
        Thu, 19 Nov 2026 00:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:7005:b0:949:6898:2e4b with SMTP id af79cd13be357-949996fe1c1mr829344785a.66.1795076742036;
        Thu, 19 Nov 2026 00:25:42 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:41 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:16 +0800
Subject: [PATCH v9 14/29] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
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
Message-Id: <20261119-msm-dp-mst-v9-14-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kSG1AwjhdD6UXXB/LAoKM+KcPZ/iXxLYW1hElXuN5Nc=;
 b=IHUvVKZkGRkoW7hQeHl3YpQ6YDmXlLanxPRfT2SaBkyaR7C5gQLgk1L/Uo7kZTHecoGa1oaHC
 uLBGr7s+ww4AFEIC/HqlhYOEJuq/o2w6Ly0xpX1nNFFCNkMNXK2Lf3W
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX12Zk/9id7Y2E
 83uK9XrwXiT8T5y3l7KCc+q8nT11hWMPqsktjpKhKb2WngsJYVL6ayQ/fswX8JIkioig5ZmqOfH
 WCmLLw9v+zMU0lkS9zYbl0kJBavW1sEekPnwMKZzWN2hrSB2GqQ3/4ymcKAiaKjqVBqwLHkB/93
 WFlwnB2DFKCscMvPe739AO8YCcGcy7C/5HbUK5T0Ew8uU0ZXJgagY/YKB21KwlB+jk+ujjZ/mnj
 n+LDL8AT7vkdSydHfNB/1mE7jiUzLqNBwiy1nABAXi/lvatx4k/zozsEEW7APNggf7A9XdPfas6
 /M/va2Qp8nNiiQ0CZPHHQelSIgSPJHVKX5Zb5ZfkswlNenezTGewAKietAyZNpqgw3KSXcHeBqZ
 Nj4JGIX3St4pi0vnDt4J5an1ruGPCH7mEFVAzfYw6ABzfjexWjJlHME+yWgGvc+adfEcdsCUJ0Y
 t+qHXFbPdnQHVINdxlw==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afeb287 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ojeUtyFwBU4dwrdywPWEMZwqDECtbI0s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+Vr0kltTqA4g
 P2WAyNPhjxFmF7yFoT9AgbnUofIAXD/6gZZGCysoT5fTX4LWHVJAhq32OQskAx2QcWT5SCgDzz5
 7+vlWKaJr20ltRuXBQpniKtntEjZrLM=
X-Proofpoint-GUID: ojeUtyFwBU4dwrdywPWEMZwqDECtbI0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..5e1c98371181 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1435,15 +1435,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2672,8 +2673,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

