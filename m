Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945674F30C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055747; cv=none; b=Q3ZkCR380rxWx5mXm0M09Lj1oz+ycgSU4Mmkahudl3SJjrrxCxgnGyHk0HlMetdJgvy4VpfentDeNB89jsSYnYHQpvzsQcBM7+Rqw4K1gR+D5H0vWYeh8CRsHUeBYGbzQcIweNLaTifLi4WdagJTrCNMxYMD3l+70Gj8ZMn6Odg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055747; c=relaxed/simple;
	bh=GpdtqPuhIHgUo+XsjT0LPFpiwfUdMzHGUCn5RPhFeME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvwpwhIA1Y/jQ3kuhqzwIprhI4KZX75IM2w36FkrhgqwNT2sYyn7eJtnJVPTJK3rb3XwEPv2iMWR7hkofdp0f6BiW/93ZviA2NOzMcaRe8OvgCVnvHHiLrbdVcCnNroB/s1YPhjOTE6AuH4yxv/pg+7h7uJnCYLAGC8Wb9Kkx68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrxZav4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqFHrJuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrxZav4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqFHrJuJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xbOH2738695
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=; b=OrxZav4mWEwsbSN9
	rGHR1DdvgyAxQwLgkCOyuBYejz1BpeKy46R8Wo6x83XGNX4Ud4TLeBx9G5lYepMZ
	XkddneI1OhLOqCLimpJtcIB8hd/kNXwAKHZ+lCuyHniwCW78D9EuQbQ0To8cA69p
	LfWbBZhS8ps/vMSoQIpLN+NpvH3xOlDYWDRlxvqs0yvDAHJWhF8I33eITGShVmwi
	pqIHt9UmMTXPsqKU1MiWn5eLyVAklvC+L3rD3IFUiR9sQJ+xyT4W2bIOzDSDvw6p
	v3XU0UCNKg9oCgtk3rlWYrxoSwD1uqDkdIRZ/TN/FvfU8JJuElNUDSQLDkiDLCEe
	4yRjOA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds977n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:15:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso1348786c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055744; x=1792660544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=;
        b=hqFHrJuJRPA2wfyeqMo6kahYwV/MhjPTckrFXYBYbx2OWP8kem9KzXZZAw18arfGiE
         QwzwDFSv5Yxk4rspS9YNqbqNRyY47y4lEu6h5/M38zIVX5sR7LeKDJva8pK5NR0iy8eC
         nMqIeLHJGW11qXoUieQC7Wdzf5Es6dTfBBchOCpXXVSUnb8wykHTTjCii5yu2lRNJ+6I
         a7Gks4XGO8F4xRGXIMQCD6X1KVGgJPlSKPCfz48XUyDBrX02ZOSrH2cBvk6rRcUAsJXN
         mjWlxysMmeU//SmJ744wi5m5kc5JvbQ4kAUq8mTFB8xkzQFW9/3r+gaeiea2TjV4i4HH
         Eszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055744; x=1792660544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGMnYlGXQieTtFbTjiko9Pi+37ioxPIws0R6S3kuKys=;
        b=rm9n78yFRdx2enVrKXKwZxt+7t0WhBBvteqJUgF9sL7pZIboBjcdq++8g71hbVrdiQ
         SxykGXQhXdcpkIjMEbF5I1G+4rBw9r6Jbit5IlKCQmuHcTSewdownFPbdXJFxPXOKJCB
         2ICRIdVLGzrlRzAYTLmAYjxv9o4eEM0foW7ZLOyzdY5FLN+Trz1FypklruwwrQeEUJMX
         pJHTFtA8645rGFYGpkjStIkHaSHpQ1F5QZBimHjecvhl8CUDmZHsvee481to227I8mGa
         RFG0vKAWL0Bjaz52EcQssABnTaZNvrbN/MB1e/xNf99PKN0Q4mW+dVQSLPt3JQZU24al
         kFcg==
X-Gm-Message-State: AFq9FYJYNFYAavwODGPUSwiEfnFgr6ifxwvbAWFdHqjxS2PLhFf2O31F
	wLgfJT3EBTUbiW7vSLNm+5bbQzbUbQQnVRz5t3JVHOJl+ZHWa/Bwt2d+vJ4hoZSRMW0GlnmLEXG
	YRIX+gfpnhWOEnqiMnMiKxLnOSHvCH8VFtdzqkpz0IrxuPyriO6n79orqbsWP5RDxprAV
X-Gm-Gg: AYBFou1kHtJomZ7wdB+lXBV8W4Ey8wUJcoZHmP8tmDkRzTK/CdJWG4huhNPYR+WNVHU
	y9seh5jd8D3Lni+JPGHqcqd4IFuIlRZaNzK45AORnm/ONt616fYt+FHHWRI0EyQ8bxjAcwPpbDd
	q66x1CBueLyldPxIgCakNi55dzpSs7rNhlQspjRm7+j56kpkaAULfh4mFEU5ELZzmrniszifXuq
	xG4v108Oqj/PnaUJgp1uepZwnH5oeWDAVIzHpe9+hdWkMJCayHRV/Vo+c6kPa2vq0tiISjaRBqX
	Sx3gbmlq9nZACYagDD92XKIvYYGAWYbCJIKaEeolKfHjQyk7FVUhkhAqMRYW8LZdE5JZFcBFqmS
	v62gIDptGL6rrprNJMovcRdsl/Q==
X-Received: by 2002:a05:7023:a4d:20b0:14e:906f:9c8e with SMTP id a92af1059eb24-16a5ed3df0emr24935856c88.20.1792055744141;
        Thu, 15 Oct 2026 02:15:44 -0700 (PDT)
X-Received: by 2002:a05:7023:a4d:20b0:14e:906f:9c8e with SMTP id a92af1059eb24-16a5ed3df0emr24935824c88.20.1792055743537;
        Thu, 15 Oct 2026 02:15:43 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:43 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:45:29 +0530
Subject: [PATCH v5 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-shikra-work-v5-2-5e075222b60a@oss.qualcomm.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=859;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=GpdtqPuhIHgUo+XsjT0LPFpiwfUdMzHGUCn5RPhFeME=;
 b=14xHplB1bkeMuVzWZkw3U6O39JcudkxNuOezD3gXZhUH1cfQgYhKUCf7g70C1Jor5vnZMd4ua
 O2SZU3p1zdsBOeW3eHv5zhfhZP5ZAKHgiyGMYbWCdu4LKV2ex6pHORO
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: dsRg2WQ27B_0mZdpj22dlc67hroRVMUU
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad099c1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TdSgRHaedGDaTSzhpQ4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXwFzOx17wKGWq
 GptQRzSFy2guBVMZYCkfp5BjJOu8n5TMzwDPqLMrYY9tmIkdMxKBQDcoPzSLx32XPWayYtA6Y2F
 O4XpjWgq26IUgrf8sT6eXwPwyQxMzSZAYVcmJHxEShxUaUHaXeVxm6hvyGW3fvoVbPVLjMJE9tj
 gUpwAUv1E3cuFtwInCuBAVy6ZlKFbkuqx9IEJaI3O8NMwkC6nVwzzPqyD6rX+oBUL2EBe6Uer9z
 koF04mbydW0V7FT6q0wdG10eMzH6xpiMHPczYoUfRDGpbbd91S5j5GnU+DSknOXjI4raexJ+fSC
 mMu256wnZvCyyXHwBZ7tV1nyJkMrSmZjCDb/8Vo+UFpGXg0p4B0V+OLwbnLRgyli5ImPcel/Rr4
 qjh3Mwfr3+eb6j8mKAJ4JlcUsiiJOvZV/t6vPVlo35ZKwqf8D/fzv42u1rAk03AWZIzqcPjSCEw
 RXmILpTEsQEkMIOmMGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXyNLBxhNPYO4Z
 lSKbAZfU+54fr64Peg1hF3pg9Sl6kMVkIH13B9ChZU9F/e4DwJpbOFCwCg/r302BsZMC+vnHo+y
 K0NOsuMg30vEIfyykqPBWFtHNdjwMAE=
X-Proofpoint-GUID: dsRg2WQ27B_0mZdpj22dlc67hroRVMUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

Enable the Lontium LT9611C(EX/UXD) DSI-to-HDMI bridge driver as a
module. The LT9611C family supports single or dual MIPI DSI input and
outputs HDMI, and is used on multiple ARM64 platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65fcbbfc1601..d18f72e55330 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -977,6 +977,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

