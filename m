Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768193;
	b=Bl4zBfxBD7+RqN5fGLFsPQBvZsgR8PukOAi4qNAQcPcHmZhTsVY0dszfzLj0M+zzq/nv
	 pDz/LR4AHT2beESn+Qmaln8rz8KpJpRqN5Qb4SQrTq5i04ipHHzVx9gJ6d9I/FhxtfGWM
	 Ym1IGkDRXi0OeXG17/Ic5fe/cYsLWYGXCBLqDGC5yI9UMYJLcsj+SNuPJCWdzUxN/7qG0
	 ELPwNMclsYKVwLoTeyDCX0/anyKyKSntuEpUuVw7js5YbMYBfK0+aEw9c1rNJOOtCz6rD
	 a1FlGJObSuDJhNuEpdt4HjItIzMAO/xVlfHmqcbQWBD14+4MA+YTF27gFp7qCtqP5hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
	b=mHI6CFUHBtXgm4h80pIoQdTCngt5d8b/7ZU+9juPEX+a2la5glkFoQC0abK4axCmkcqp
	 ir2TS84zfHAF2884twWEje1rFWpsfmydR/lCMgxf/pAnqs4pXJlPUR41n0iTvwb1Ne6wr
	 6SZQFuNROORI/EPlRyXkakALALlgrojtn0BZRWdGSC/GzU4ELHlfUL/kzupzViUj8Uean
	 3gE0DXgzhJX8bU0dYW2wr3auMq7rFZDw/XAQHS4cq29MB8M9qP59wJ9iRMf2fZ0EAeSGz
	 ot7wXOdjOnGE37yuWhVLPCk7copHDuC7gyyupF1cIC7S6tTU5QzqO49og2xt0sqqLGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OB/M08LA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE8606C950
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CE8606C950
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB/M08LA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5shW4072746
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=py6aQLEBrnTvjNjU
	gz7uI22+xwpuJzETVKih34DNDaXYpQiDG/Vw+7ck3gZZn+ACPRSForH3VG12l1uw
	NKH+7didgfxVfOjWgkyT22d3pZxBhS1XNci/Bp1OApEPg7bjlXoZ/GPpfBQ4aLes
	+Uger+I0Qly92vg9OJul2+Z5ROMBDZ0FZ1gNgWYWU27n5vNPxVAoEfNf4IIrp84O
	CPSSDOrO68aODZbvMp/pDIcVEpW8dXxSPf0FdxyyrtZUDOr8OWxQ80omy320pEfV
	1njcrBcJpUu8c9UIpPmcsOyI3EbAN1EZAdKNK3oQncT4+98Gs3HRaCjF7QMcjo8q
	u6m6AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0nj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so167476985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768191; x=1793372991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=OB/M08LAGRpVrRAdzAXcFZVTLb4hx2ryKl5A5yvkq8eXC43R9QjuYq843DXi1QN2Ew
         PSq7yRGJEWBxc5vD7zClSLqf/mrr13dvFMIGrqF7pacnATxkJSJrRrBX1aTvj6XwhxPJ
         6HFDCfKzW6gNI/6+Cd4Mqz5U7vdGLoap+Qc6XHPJL5lpmVMq2KEhqqopeP7G7wSvf4Eo
         4rvZhyZ123ab1in2UAuUCUU0JKv8DMipi/dJkUT3Ie9rNamvZDWRbluvHKKk2TOddfQh
         Pank4SBpRiIOrISlbXho6+lCQMNp8R+fINWoMMZtgmMV0weWROw/afnXj+pL6CGHppF3
         5qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768191; x=1793372991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=c+c2wpc1O7VhGrREQ0KXtFCNdiqqCuP9BeUaElZYhAfMYvTS4roexrOqoTvOn/3Ck9
         wzc6pvwjHDuViCVgCXz0paZ2KTe5Hx8pYDqTP9P56P17PGmBBncl+LxpZ7JsFZI2kdEA
         6S4FzlOZyw9kG3EKxoDtFyu53rklc73I5zEpbGnKExJbUp6LOZHfKrLXKGC/3zFeLqiN
         nf7k1l2L82IrDkZjYsPAYhOCuap4cpC0LxglE2mzUxMk1gSz8lrrgBXoe17svkhv24Yh
         pqtPMqa2RU+jT0b2HQ0AN6i3w1IokUEFa+lrCmcVIjw284xeo2HXMcb9mn1k3shlLf+x
         dpuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjb/dFa/k3RoggFmEpe4Yn8HnQTOUUhrzl7SECMBTL/Qy5KIdHi1vWBKuHMav5ifG95NQFzlrqRnEPFwbx@vger.kernel.org
X-Gm-Message-State: AFq9FYL9rb+I1SPCAJ1kjunVSyl5DN1VBwH8je47iZafWaMxVOwmLaQy
	tjleB5ok56GjSZujcDvbiQY5pciR5C2tf92jFMGYY4TPlV4xNQ5Qqp2tjm2x4rUJle6hU5Blrn4
	gN5b5h4W9aB6uLya48n8u/7TKiImEmtKngaNvs4ibjSeuFQEDihWx/j9POZ5wP1msnBl9
X-Gm-Gg: AYBFou1TCIRSO6KCkbimWGNtGhCv76rAU4HdB+bImOjdUDldSVOfe1GUcqJdsTQLm/5
	a/04qcCB9ALPlXZ83qr+4OE6qGI2AU8ZQ1dcIo4xrE+g3wd78dTyNhe0k0MfA1BvLIG4u1JePqD
	xR4xYF4DIScofZLN+aEOMbfD+msBjX5cFKz5x/aoGOxhuFW8+W7gQIo7O1u71APb78GN9+f3fqT
	51UBs/62S2M9laUuyt923Fwb0U+Czxki+PI+Il4j3IeYL3v/BAZf4dWP5QYD6Ud/Sdm1WosDZij
	TOMc5NTIFyd0WrGrRMKT38LVHJVEYiV2F4usgMCR3Mvxmzw/N10iQ2PH+8v2686kqps1gSbdQpe
	oZXL70tX9rf0cHPgDQ2CcPMXA2QvHvn1uASGcqOT18f78P9ryBSzfG6goIkECEInzt72BU3MoFL
	4O4IKUSo5V/oJnSFED3izm6IafSGER88exVy+JjCX9Q6QfXSrxvkg=
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483891085a.27.1792768191491;
        Fri, 23 Oct 2026 08:09:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483884385a.27.1792768190952;
        Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:20 +0200
Subject: [PATCH v11 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261023-camss-isp-ope-v11-9-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 6hDToCekke7K8Yzk5cXmJaDRJIhkutif
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXz7hn6/Jv4LRi
 DmGX0OiDXOygVlRqAO9daL0U7W0XSUy38WMCkoUGwK+PChIgDxNDa8zve0hFRj0+xnVKPjepj2w
 0+39Zlja9flHK1R8+HPdHagK8nodi1w=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb78c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6hDToCekke7K8Yzk5cXmJaDRJIhkutif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX2u48mIBqIusS
 jZlar2zP0TsOTeZtAZdjLoQUoreHh+W3aIK93mysTbMod8j1eM7ytpzHD7ovi5qWgWu3KwG7e3F
 Rn84VkIZ6wkEANXlnNevr3kEt8E01eN8ZGue8bblT2CvXxtq6bJZGk97ZclB2C8CYwONSHBOKYd
 EaGJH1TyeeIUIeiDHKW6madtDxvjcV+ck8O4wfJIJLmG/OMuvGpAQVa7vqgiH/nwehRZNXhSbbE
 w2JFOR9cyLbEwLuaEh2kFRkXtN8AmJ7CFv9RpJWFwRHKv3QmUZo2StF+D5q6JuxAD2hguolyLCd
 tzXemOX0Efa1gmdnOPz2jBA2B28rwx744hTHmB9W7YyVjtP/Ve9vBH4mrc483RFjzGSzMkDyLY9
 liN6l/OPc1G3GuygeMuYPXbTPXIoRQ5pPo396pcUL/uLZM3bfJzJk+9CtstKsDFVKuA0oVHsQlC
 PUGJ83mG6uKFW2XD62g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

