Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517595;
	b=4iHHNMkllkxztA7sezILa5Vp/9ymqzcw1a8Xu9DqFI484Gg+QCx5w9sgbExDCykmE7Em
	 3yqF1S70pOMr9zTjEhN3U/sbI5ft9S0SSlih13mecEcplt4CCMByfT0zXXns65CwtyQ+g
	 mKzEx4cjfL8m7R607jlfXo8sP5GfwjvV/CNN8W6E9Hs5kkO8YSZJR+Psb2RgDa6ZqinY9
	 I30unt4xqPJCc/FHjxdGiWkly3BO6HLtdLDY/5U6nVWBmlzjT0nzN0uEgwXWtUcxehpka
	 pv+NUgLbgZdhQw+mhefDVX+59HwhJZHDvouv8JxaNW1IiZbLoYCtRlL8XcL+/OwzSKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
	b=ktBcmlJSN0o+28a7+CiP3hqRR1M/pdsoMVebWfK28rkSxuH32ItrhkUvgk32OpGXcWQs
	 DjRC0WaXACdAMyjP4z4FHwOMN2LBJRp16weoFzY2QOiMtZiOUqMXpj3kLEeCxdiaU0MOQ
	 Jnbwvn5o23Eee5is6DlDnv/3aofG4asHkGgGD8lvpooU+fxqLuhyJFalDtWljn57aRuqR
	 8y5pBqFPO5D4ydEJDWLQ3/O2MRl4r/0lGyJpRoCYDjmwfND+cewQHZOWE5hkigkwq7chD
	 irnBdaTOmQSWlm5fgy2+iVsVf0kn7/GgMCwfeqC00OS3IAjQ8gkD3T1wVuBgQOXP/ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22157606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22157606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Q1oj3701111
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8
	Nb2PLcPQ=; b=ZcdjbbCFeBkHeEdI4eqLkIstKBiJ7lJtG5BkB/ox7z1NZurQrYQ
	Oh38tErfA9R5OebUUn+a1ZCve0EGK5tSMLpKYKc84UzjjZ424oUQ9Z6CSwnDc3Hq
	xSkoBdaSa4H+Gq0opVvTTAs2V1tha7CUIkfSUO9G4G8hq/5KqRg2LKODwJAI/OjJ
	X3B/whVU3ct0X+/eYCoAaHvb+iyvn2lB7k1VGJ+W4o26u6S8etmeLr27/iGS7wUZ
	owrih+TJuKGdnihPc/OXb8VSUPhJGth8e56wvyRT0tvKz+dk2HSzogznv+NcyOpW
	fqGOAHZkqCxEgS7C6L3g0XjIzvQN+GUKlEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky260a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so4435643eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517593; x=1796122393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=D4CDLqNcrlRgIfEsJKBpsgKqGbcP1hFHAzw8oJSVG4n4EpkUo/VUsJqjTLyJrAHEZB
         RMpRloGUE4caD+E4ynbe9/Bu+Vfx1FChoTORpiEL6iGMaFG+B/mTO0Oy+LRsWgXJmOWl
         jI0YSlYEYafrcAmv4t7hbLGa0qWyRGsgFB1gjWRIODyewj/I02gBzc5p0t3z5JQC4s/9
         BQLXHfAmuKoiJ6Uv3pBb3i0HAzhz+tAje4c4Po0FKPg/MORFijiLfrhoDXDFpZ+E/MJF
         pBgfApEdwP/OoaeZcLYyLQck9/g3NQvh7MiitqQpGRYoISU2oLE5Q26UhSyZq2Ah1mP1
         s2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517593; x=1796122393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=Dju6LCXyT7QZDG3w7cwx4gyb0nxeoCCt9kmmUMcy1RMH43I2DtLaIJ4+435ZiOyN+H
         cpliVR7OjN/6xsJsNjF85DekuZwYss/13lD+GPRxGGCAIEwikGZla8FD3Ytiy7xsUkHj
         klfABjv+ymdeQcFAgqWM08mpihVgx8sjxnAW9PCppbaP9iZvGvVKUxJMG9jb/J2+HhZm
         +JZqdAhfv+w4yk41rU1Gr6I5Ll2Qgva8JGZY/GnlxUNdIdOkqe4rbtrDCpI91T25pWqR
         QA4nwps4D7HP6cyDxvfafjxboAKefpgMR7wnS5qPRf74C+buerEJD6AGdzDqdyzXrTdj
         KfKA==
X-Gm-Message-State: APuU4Z+BMxAFs6nq5TnDnixMwwwer9C8bJ1/Pp0yP9Jl0Xv36SUR2GTb
	oth9hEWjn8h8DsuGRFLK/YwDSWl/Ck4pClFUAQoJ6KTuCDk5+WcieilNqglxVmB8xfBobSS0j5j
	7K68sQUoK5rDjC4vakPS1du7jFy41u1ZKZvV7YDSTf44Y+3gDt53QlJrXUek/InzhFK3WsnPSZi
	ik
X-Gm-Gg: AZFdTZcB/hoo4IukQqPMLUfncPy2gHGTLkEfZei1rgI0/d6ns/U1MMK9IW4Z52y1wsB
	wuxyJlxs0hspLyNwMbOg/hJGxXLkYQBWRVcN5esAxSZ+d2dnnnQG2pRb+VndJGRRFIEGgc5XQNT
	Jgg3YQrGL7lqLPtQVVVHxWLnc3gVfjdAhJFeKgXk9VbAAz9Ig1EkhMrtPHtDH6B4kun8vTC7h1A
	z3uZm5LCtUpOJ+y26KzN0HNREt3esnbMCxE122R+2z9j9wt71o2XI64zzd4DOD9vP6huHc+eESe
	fzTNnZKlEzhRdpsstXAWmZDMBtLVnujl51F7xfyUOdkGDvTQvp+bsayi14CuGj1nHO9Z9dkrzgW
	2pfNvo8pdQrsWVqJykCps0aN20SRGsVopfN/AJUw5Qxjvs0qbo4rm22euVaHc8wat44Lk8vvuQI
	LoN1bClkD3mYb45+Yb0hnn11kwo5FnY/kKqQhJ2/9KI3FTMIb9t7LJbj8L
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232611c88.20.1795517592574;
        Tue, 24 Nov 2026 02:53:12 -0800 (PST)
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232592c88.20.1795517591912;
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Tue, 24 Nov 2026 16:23:01 +0530
Message-ID: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056c99 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=lHObh2IfMKzVuqTG74EA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: USuWgXK7DElZBvHtMZYWpbhb1ba-vGlK
X-Proofpoint-ORIG-GUID: USuWgXK7DElZBvHtMZYWpbhb1ba-vGlK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/eRLhg4pD+sK
 88fMs6jvCKfaPYpqP5tHSFxj1cOTlO9J/VtTsbB/abLWbfjbHY2v1hS0dlsFMA7uXXA7x4VYeMh
 oVPDWQLJ8FfERARBj9G15qOqWBw4yME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0fT7hDRECFy+
 /6ZQWBb+Y8SV9yuKalrZ2eDMaIQt/YmO8Tul9NljKnr+jb6w+r8yxUkh4Iek1xY9tlN8mm2d8vx
 mkmLazZcP+CzNsXb/K/5XysBZ8vzzK+cY9nsLc4IT2bptb5MIugU+Qmb36HSgZkqIaEmYqWy1LK
 0W8VyFRKEGIk9eqDpdFv7T+o0nRARFOEUuDfiDBPjzTCnGYprkCPI54JkzD7nwaWOvIUh4zedtN
 dQ9p6pKk3gLmXPFzB1DNelXJpB2N7xMQoIculp62CnoZ3VQWebKR+FtPAe03tp+VCp1dOh36nqD
 65qyfmdnHsLznuF9rPSVUvBAM6+DEjOCHqOFIu01uCyD5dhCs/MC6wotAPNNOWf92789CF85WN1
 b4xAwsosfWu1lYLqKpU+CWJUa6DznqpEA7jsu6kiecXGQAIFFXOdLx6wUa3GLHUphGcBnIBmeOZ
 A1nyPNvqx1kGLp6lDYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add the TLMM pin controller binding and driver for the Qualcomm Seca
automotive SoC.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.

Yadu M G (2):
  dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
  pinctrl: qcom: Add seca pinctrl driver

 .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   11 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
 4 files changed, 1852 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

