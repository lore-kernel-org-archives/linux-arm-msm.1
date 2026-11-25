Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593614;
	b=GNIZLUoJOmRcFE1YBLj8ST9yPQgcel8o41bmE5EnhtI1uiUb87CrLKck3OBQ4x+TthYg
	 FsWQQ96TelVZUt+1E5ZSQJ7y3OTaTuNarSvaQGlIwuZjxMEdeGMhyfcfe4UbKYE8SdORT
	 YUPBCd578kM6W+TP3+uuAv/84D328SQSz+2fjcJFx7zGi7IOlCue3xceKvpll53/KuLKC
	 wFnMyyDI0c+4Ngtjb+jzIGnIC6ddpC8u5z+1Y5bV4Ng48/5cRZ74UPlehsajs6sNDWAKS
	 cy6lXRa2UFkZJA+UkZTPE9iVIhlayx3JrSu1zNECeTPcpYEIZMhXKyy4U2UFMGpzi5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RaTpNYsU+pyqZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=;
	b=vMhGIEEoaBNVlrffH30tR6fjwz0TG00bmGJPFdGbN0wokz7fpFRDRostl05EL8CWOBja
	 raHMbevI+zDftgz9GHvfIcLqAgX0cKJWM3k7PBQZ7wwhDq21Dh+VmXK9xDOJuHlbnb0Bf
	 wQzwjAKyH/vIocszx6cjI68KE0qlpOjwgWhEy14zl9+3UtEQbK2bRAVpQSHqW2/wre6l+
	 rntQk7zKkRYSaUFeLmTo29FdRvkqVDUBzpsEZBIidngNYn9JHTWPcmGxgtufw6h6QzL+K
	 2ELlvUjz1H2Xq0X4wX/DfVilCNYGs3t/Z9zP5jRu0WX4vSw6NtRohctVJ1/Tbfutzfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUeM2dHb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0F6606A6A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A0F6606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUeM2dHb
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68bnH1860415
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RaTpNYsU+py
	qZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=; b=eUeM2dHbZEp6XUeYtUL56y5X27a
	opEmPFJwRR7WZeGDAx92O1N3PsrgIIx9enWpGXvnAywGHAuY7cqe4ssMJcahb5cb
	FNhuVwq7rrINqRMvE91uLvFddSSrvFoIT/VvDNVhmrAOHa24+uvhppcXfS+7cHnh
	LpGL442RrRzH07obaI67WcieFYfrEPgAm3Lv/MT3gulq9/MB+JCWXXLUzJWkzzxP
	5uXZfthwGfaHMRTaXFMpQGAEZshzMNjNhVDumBpqwbNQM+TIjlQ3vX72wyBA0nlg
	kDfxFmtKQ2c+ibSpliALIcIID/xUdEwRuWkSd3Sa7Wjwi+eyfzRqxJWsg8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69ann-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495c71055bso142116985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593612; x=1796198412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaTpNYsU+pyqZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=;
        b=SWc9eQfHXNrv4hoaaA4d16oqGiKC+RhCSKL63yagEopewINVlOfoKB3huCpYLyFDBM
         1EesuRuLm+7CV/jrbryUpNSEm4cEBEg09wQvPubvNokxpOwK07Hqi9NY9Nl3uZUs5D4p
         2vqV6EXtmvBrInMJk/uQghLQL5bkHcY5QfSUaP/5cUEG9oAk+B/YXo9LiltR6LxuDuTs
         GfWgsAGIz09uRL5a2mZC2VaZBWzkN5ZD/svVztYifdIMg7vGbJiaOReMgYVQgux93Lnc
         CmELr/FCIFSM0A/2wGWoVw3XRb/dlfMImjpLoykxIra3aAuFj40zxbjiSMdMsl2WdoXv
         A98Q==
X-Forwarded-Encrypted: i=1; AL+hErExIE6PFqZ4HCV7GKNtFPfUn6gDZrpK1PgAxGtyo8cEJPRHu30sIQ0V8xCX1H6rLH0hL0VDwbIpENqZ3Et0@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vr9TemPPbMECZMJwL4Dmbv83Ngy3p0JVPj+goLYhJs1jgh+PZ
	u4wVFBgQEsx1Q0c8EVX+cKkNlg74VxBloSt4F220uuvZI4OpBf32JMSqOPO8asUu12THqZQctDG
	cMt8PG1tQ6YSy3SuoAHGl3lZDIkXqulQ3E3lOPVFK12XRIkgQ7L0YLhOHD342yTsdRjCM
X-Gm-Gg: AZFdTZeej83mxRyGy8+3RdDLwct0ztCHORzsHp7YFqghD/4WSSxsmPA6mTjeSqcOjhB
	IluwRH56eNV5O0oCvXCXqLVPGQYGO+f4UdOByW20Rdp95cCc32wBS77Htio9bgp828HRJHDn0z+
	JreFJpXc7ckvZAAjQKTBGuzeSnHRjARdbuLe0H0rKHL3BpJDVoTEkLQolHwWyk7PybBUrhRBc2M
	snOpL3WdMm47j6S7ED0FVKtwNa3b6lmtxwDFN67IPpfFuvY5pDpWUULCWPXDrK2MjXYsjPiIAgF
	CvkxufNRjUnwgF0z5qJTfLCiQgCtdDh9ObAwsbj+Xpg2R3ZswiT073KtVnPByPS/Y7vQor4jVTC
	XhsskjmYhvOc/ZVhhxEBgk7h4/VE4R1HA
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr2838320585a.61.1795593612474;
        Wed, 25 Nov 2026 00:00:12 -0800 (PST)
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr2838314485a.61.1795593611865;
        Wed, 25 Nov 2026 00:00:11 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:10 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 03/12] media: qcom: camss: Add streams enable field to camss resources
Date: Wed, 25 Nov 2026 09:59:52 +0200
Message-Id: <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ibYFrYgDvUSECMO8k0m7zsguwZ3chHT1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX+M8tQJHb32vr
 i3PWl11Pk6jBIw6Kuf1atx3lxJEZ4lLmuTzuXafw4SxW1rwuDN/AB7wi3+qeYiLt9YYUvMxBna3
 MLr9vgM2W7dQeT5J02odwvyXrxygtJE=
X-Proofpoint-GUID: ibYFrYgDvUSECMO8k0m7zsguwZ3chHT1
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06958d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Zc0e2cZeo9r8mepgbREA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX9PWZrpncB+L5
 zpKye11KwtBZbLWyAe2gVGXOxxEcs9qic64wcT2Pp/Nq4STgPMwPGa7fjCK6Qxy+Y2nS+G44b7w
 J1o0Nl/riO4+4Svv8uY7IYVz8fQ8DAF37g0RYZeuGRQXArWMA+MIIcNI+GYVEPryFkoohAQdI2i
 3n0xn/x6odWzpSVJYwAhNkSY3GZKcC4ZoneghXwL91y7NYMFOwRhADKHX+hvgm8QIZ2doeWXa8P
 JhJsebQHiKkEEOObUoQTi4oFynqyHpf76NmVf6jEESU6ne/qisXAdTUoBzho2JTH/98hRlIWuBT
 tWXBxCCyFSbLUfs/VB/2OWoF+oQN6Z4q337CHjECkR92y9erkmHjDYXSt9eJx+z03jBUx7Ej6We
 oKAcvn1uYOUeokQ9EaOzFxu+ZAu6wIDIukxnN9yBxwaI/oJ9nMI3jc3E0Gd4dRMkWko3Zhb/6bs
 AKrz9zG92oQ1vwsXi9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add a per-SoC streams_enable field to struct camss_resources, used by
subsequent subdevices to select between the legacy s_stream()-based
pipeline and the V4L2 subdev streams API.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7564a7c46fa2..621ea2e3eba1 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -121,6 +121,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool streams_enable;
 };
 
 struct camss {
-- 
2.34.1

