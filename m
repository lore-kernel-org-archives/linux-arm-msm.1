Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495D47277C
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350254; cv=none; b=RukCThTkTbtpVmzKdr91KBg0HCrWswbX90+fRGG1WT3GPlqAt9mzgsHXwLqa5B/V+ajg1XS39VR8f8z3W9PFOZGhyXpfpzpM1YQ1dV+EJwDfr3DzvKBJITjWI5u/D6bMPXJqeRYfI66jlCEi8U0LABE8PdaGkBaREZaU39z5afc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350254; c=relaxed/simple;
	bh=8SMX8raZ+hmw9c6gx/zwZ28NS4+6VTWeLrbJhslZaPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WWAzbAQgEtcpRB1Tk2augp7w7DoOjjdpfCTN4oO1mo7WqW7MGOjn1u2DUw+TJmWNp+653QLVFKt5/eX68OWFDdM1UzL/PIZLBJwZxp4Efl8X1gTvkAcGpQEH1DVEhBkZ6uGu+OGQnQfqZU7+ibpjybXQAO/fk9HoZCg80JIKmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqRnWiCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qjnqqgr8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqRnWiCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qjnqqgr8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NKAG528556
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 11:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TBpg98HEt8ju+qpeLW1qM0
	eymXvDw1BWSmeFb5J4Si4=; b=LqRnWiCPLApTAt3F4UAI6buL1Eo22w40J6k+D1
	Dr9bemzyngFzKbDX1i2X/lP+55QOMzPzEY9/wl7GTsh7dML5v4b8jpBCtp0zQyEe
	8ah899mCj3L/EhkR5O5+F+XNpTblo3c1i3vFnM6+4twDseE3BQHJ4n8Da2TqscNb
	I4qy+5JeDJRPFgqsiHignR2eUo5YzZKrN/pLkAQYp01RCeQ+iihXgr+w9ZkZySLz
	HSiJrUa8O4OIAXzEjgA18PPZNHcGUYFjVfVCB4hDTnof7YNDx2F7PQX8N2BnZDDW
	R9OIl5PfX4EadHTHaZu/CZMzXGe77a3xz03BCyt42Sa/Vbaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397bssu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 11:57:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-933023a5980so233456985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788350240; x=1788955040; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TBpg98HEt8ju+qpeLW1qM0eymXvDw1BWSmeFb5J4Si4=;
        b=Qjnqqgr8Py8pGg01La3eWUO8cOyrvzE8Gdi+aJbqYudB/8DwTAO2O3W6R0LPF00oyp
         szoYNuTOiExuASoVDS2J40VSfn/Y3xkDTeEMHq9Prsi0SbSv5YEaPclg5tka1duqbsCN
         IeZ5Bp7P6OAz+ugs9oZwCSmbwIoneQI9fIFRlru93RnM7lg8o8f+m9GWngNX3KNyzbHa
         BYGMpuG4TR8oBA1nK7l4D4qVJy5ckzHtUV0AFEPKLHQq1y1f+i84RtGHwio/wRZUMZ5N
         BQchcmTGR/8lrnrlcJxMW692r9Nl8MQdlmxrp128ijABiUIrwxk/ym5NB2IvNuWHhvyg
         B6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350240; x=1788955040;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TBpg98HEt8ju+qpeLW1qM0eymXvDw1BWSmeFb5J4Si4=;
        b=qHITVZdfvKHpu98viTzWhOP0liYzKvIehKDa816oms7j9yBR4ELI507p6g49UT2W/g
         oMHaMn0dftZW6ePAUR5gvYwvuQtbKzJSMEJitt1iaZ1tgUti4dJfNhKLhiR7+u+N3cYP
         dKFa/aS/7NRJBLb10nZFuBf0RU1ud2xLeoImj2CLNoIcipyAwXiz8J302rdKRilgyUln
         8OPf769SMb4kMXJQiYAUmQwcYLLX6kg3Upl4lKCEd4hjtctPZtGF+7moatQ92hwQnK85
         DtVajFLMUsWjrRycfEX9MXPw0of/nQj9dM+/LTlGqOL78A1S7w40b6VTacKlz8tE6iCf
         KKyA==
X-Gm-Message-State: AFuF++nHVNrIo5ptWfoQTpJMCD5IA8Dn1NbJh9MYj1VYN4NAPKUTyR7O
	6+w8l2JpQhRrHP1I/SfoKfUbiU1QlKE3sttYGEgK99azG+SeevWfBH/irxc2VEd3LJKtTQBsQsX
	0fPIkysKE6gWebVl53+k//MMMD4sxSWUKVlOgmoltAu335pPT+/jraUO5BPmSSF/ktYOk
X-Gm-Gg: AR+sD10opPPCJWB2e8RMB4pZ64LNMRCIlsnAh3eLuviZRCoas/99wC6+hz1PNzpGEi0
	lvEpT98PxK9hgzOcQw396XThlu+7/yWiAUjmntPo7fyKdHUhvioYoL6YXZbgXY/a2XnP0sXUyzb
	Z0osRYiy1vVhAivf0E3gQKVesy//7oikc04BQLsq1y0wToCFjgA/XArI28+Dh5df4dCIQYc4TMf
	i7rz4qtQ40lHiN6B3fdvD0PiZ0tdtadB5sAVk0VeTD4piwj5LMg9WU53KeI8GMzQkYXUcFPkXUy
	NliIbRcn0mw97BBxu6i47mzWRYBJ73IlH/rkl6i+gpYb0XZG/IOxdlB+FyuqWwtg9WCY6oJKejF
	PXBCaDnps
X-Received: by 2002:a05:620a:a0cd:20b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93960c909afmr395661385a.1.1788350239466;
        Wed, 02 Sep 2026 04:57:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93960c909afmr395656485a.1.1788350238885;
        Wed, 02 Sep 2026 04:57:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm6463199f8f.34.2026.09.02.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 14:57:06 +0300
Subject: [PATCH] MAINTAINERS: add Abel as reviewer for linux-arm-msm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-maintainers-qcom-add-reviewer-v1-1-82d6126df520@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABEPmGoC/yXMywrCQAyF4VcpWRuII6PUVxEXc4kaoVNNWlsof
 XenujiLb3H+BYxV2ODcLKD8EZO+VOx3DaRHKHdGydXgyB2pJYddkDLUsRq+U99hyBm3J0+seCB
 H0Z+897GF2ngp32T+9S/Xv22MT07DFoV1/QIkzKbfgQAAAA==
X-Change-ID: 20260902-maintainers-qcom-add-reviewer-3020b57555b9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8SMX8raZ+hmw9c6gx/zwZ28NS4+6VTWeLrbJhslZaPw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmA8clLb49Baw5W8IBpWhXebosBwKHjIGTfyav
 DNV0E35YDaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapgPHAAKCRAbX0TJAJUV
 VsvQD/0WraNn9IoUUXgOMd9teHZl2NleI4PtBfgQyC4wYeA64ejKQHvPoZ6feTkYh9iEHGmgqaK
 +stU90MYT5drPdkUlzmPtuKLUNWp4W+FXq7iVot7RplhEsxh34Co9Cp4v21ixqt9PbpjHlTB3yi
 Ga1mNB7TacGAPqxRME6BC17URCiNdhp8v/oeiCbWfjGMh7LoiB+GGVYJK4nc8FtDekYtHHXRO1M
 O2mKOKz6ftuVBwbdWFSNWHJ0jjOEkMGXCCKVZcGf1oRDbHsFGn5doojA96e5XDtpp1stDji1xIi
 U0M+N/jchoRcJwDIn4EER5i2pDz5ZKBn4xT3WCP43ZVW6uiSQM6v2JLIYq3c9uHbdgxMKAC8HsG
 aSRTCRXQ5tnBhaRxfaf8FiLuE14iHeY4WQUazK0pMyNjMGsKYV4szxjeRqVwpzrtsjQ/7moQjlO
 jwMwTKCqBFR8XyvdMrm0tppt9GCAaNmFmhzwLqM/nvASnMGH91kgUn8YUR+Z+NE5yCLXXNj+c1I
 ekG3wGt3I/M5vlvrNerxV5FQE95q2tyglcNrXw4DUdvrzw27gmop7Nhskcja+bLH608DtKdNRWv
 IVnOk2Vt9RcnG7+7b0mWlCccjY7xA63MRN3KAge2hGtWc3rpqWfuJn1ayuTjY/DDWa8HOijk2vX
 gHfyhNojdcGWw+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfXzrVv3aUlhZ14
 p1rpo7WYoL+gc9xj8Itd2QxNktADU4kGJi7OfqGxOqpQOrRordVsTMQCDcyuM/gSul/X+zb8rcm
 gv807Ly7bMhG4SzpSHGX6qszBBqNoIRboy8FxBuVcRcxgj/0i0aVv+t5sE37askzV2OiqoqJQU1
 0s/YiYIUYz6AnfOtWUlNuKZtuWAOXynXJPOaPOSndOfg1djKx2wKkEUx3rsxx6oUyyiuwWgqqD3
 xPMPKcBxcwNUkmEjDk5i93kVGHlu8IrPXPNQvos3eB4VVEQ4lRm5Gl4OG0h9jwVHGcD7Hl39C1u
 porjMmYLw8FflZ9Ax7RO/0naRynMkxqMJEZjBd0iFIW4SI1KGtQUtk2pWoaALPTEf0ASHDdpE3E
 TIPtrfY3wW87xz6UhuhVXn2FKbeBrNJZ26bD6vXKxrNP2Y0ugeBEhZL+DJp2/7cuRtKRd7G9aaz
 D26Ybaj/EPDVoU3hAFQ==
X-Proofpoint-GUID: 9SyiKuHm_idTgCWrpMRmK7BLZyYHvbge
X-Proofpoint-ORIG-GUID: 9SyiKuHm_idTgCWrpMRmK7BLZyYHvbge
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a980f20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YL6Xjd1eAAAA:8 a=koLSwC8SgX8DfoFOMGQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfXwUsMKJBHy2f2
 TciMYT9pMTYhdLiQAtVra5WL4JGL9P1727EupEGfE2s9ywQV2PWW94+rAWRm+4IIU86QZ5dgMdN
 vfhYGNjt0xdIhkIa8h1GAPvszEKRR4c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020106

As agreed with Bjorn and Konrad off-list, I'm stepping up as reviewer
for Qualcomm SoCs support.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..1fdd9ce83e2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3432,6 +3432,7 @@ F:	include/linux/soc/qcom/
 ARM/QUALCOMM SUPPORT
 M:	Bjorn Andersson <andersson@kernel.org>
 M:	Konrad Dybcio <konradybcio@kernel.org>
+R:	Abel Vesa <abelvesa@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/linux-msm

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260902-maintainers-qcom-add-reviewer-3020b57555b9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

