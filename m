Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35869372EEA
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330730; cv=none; b=ZJXHG6x6ZAFPfE5GsG9ob4RiSFFpcVAfnZ/sczWjAMwBriiXV1k7Uj4EMJNsctrxYFBnohjULlOLcRiaSE/b685FaIUfFJq6kFpDlIoIZzFtw4/5KkoeXg9o7IgGv+6Fu3+6a/ONDjHeiWdTpUSeRGuu0LTEmV1hOVEFw8in7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330730; c=relaxed/simple;
	bh=c4wTHslrndNVpK5kjYJnzg6/X7lZc1ElumlIUbFLiSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1Z3ZJiZawLeNuULGK/+k5AuuOHoZCwjOaRLHzcvnW77EMYudVKSqdZFhOvh48BeDmRagfgmA2EJO6RLmXTn5GYPWKyzSW/CEbEM2DgzBDN1/B0H1NrPqKX9uiM4kH6Zjhkxwv9tMqSlbgdcni6Ptk5eP35SF1+IsqOazhNvM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHfBJyxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUwmxCob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHfBJyxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUwmxCob"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxbju2848839
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bam
	U+HGQUsw=; b=LHfBJyxj7lCJ3xfHc9Y5znKfFxLG/iTbIh6TpbKJQZv0NFIcBo0
	La4SmCrHMksiBwImlJO5ZjnBsaAQom0JcVsWThYEUEWHb6Ojt+aXIHVDFmLNkyUU
	93CpoQa56PuCMyqcu1eMimvU87YtYGrPROt0/wb+JtXlnKafJ48wPURF2ikWh8bL
	lHKmG89cp8yHOLII8SNoJiiN/pqaOWtoB9EjQs3A7eHRmNKwEzDo0+p+GRrOz4lp
	iNAnBxnVwxIt1e3bWMlVbTfu8Lqi/LSnW9eA37at5bXtzN+mv6KTXoGWdeM67Wqf
	lCXXz/8US7dW832vMsUkg4JCLqoxh/GkBkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc1v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:18:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so551054685a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789330727; x=1789935527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bamU+HGQUsw=;
        b=YUwmxCobMC0qV2zb4oKCexAOyo3kBJah242eeRLROjZVsLwohgLUcVievZnjtgWQdE
         3/t5Cf7J1/sfrwT+9o6jTKhu4XNX9gmrPSl/Ry4gECFEXqcEPjmeX3EU8zgLJIx7Oa9w
         hFSjG2FxV3kcXy5ICpip9GDOousG4x4TC5MH9ojqGnJ1fL12DqCyjuBVgmM+1033D94F
         nLI4L1S9uZ8BavoyBT5okk2iObqbpWAU/krdyDe8eHvTA9WNwkTX3oG55IwMBKvkeqh1
         waq34N7GqTy6Ug9sbJXEHFziKUEB8aisrUytELdR/vkfcbOOQ8XnAU4DgaUupTYjxZfV
         28Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330727; x=1789935527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QPVushJ6JeDYkDdFRtdAlcR9wpX8yx6bamU+HGQUsw=;
        b=ZhmXR/tzY8kwXqJH+zDBbo/VVmGZ0VLSRFm8OTgCdCK3gNsn9B29Ex6+u1Bm4VNign
         qlTEOcnnM1Y3MKLB6ynV8pPXJRQM2exoNNh0nZKhLrkWlSjB3VfsMmudHq+UlAA0oqDR
         3Yn4q6ju4IUXg8txl6fKKOoa2Bx5uEQ5Jr3YNpt+yFBEQPPk1b14NzNfneK1AiljZBfq
         yhm3bVX0OXn27LI+qAS1MAcPEKb+Ngy0G/U1seQWhlbtUfKhNp4CQfYdVtecGr1XYerH
         9UkbmhFUkXCeEQYXSPmaVSnI8+2ZyFcsQmrb5ml4qsZIDbcNO8Xr6WazADUeCQ935IRN
         0/Dw==
X-Forwarded-Encrypted: i=1; AKwUvByLhxWTLx1M4nPOQZH2b3tC93d/Wv9XfYy0eJIgjwxBVj50hylg0WTfdnRjAk8ykQeUKe6EWgtJqDMRvhUF@vger.kernel.org
X-Gm-Message-State: AFuF++kTF07pNZ/2Ou3Z/0W5VPyF7YpxJDNURUuveS8mSlk3X0pHiUx/
	0o7pDDhGEwhQgupFy1hrIYaU+B8Xmc4wVzst1WZ/xKzRDi3eQGGvJ5o4XvYqyFE49lturUpnYOo
	s75rIDeBxEso3NjObUYtpwg+21bD7kZeD8cQiZPVX/am4GhpeXSbUtJgloL17bCYWCCzE
X-Gm-Gg: AYBFou3XKPI6ojlcDs544LAtqZVarPH+M+vSHr8gxbumEDXaIVaCay03W1MgISNp7TW
	veuokB4bDgZ916W59qOHBWB4WrYKRmOsU4zHg1SH4Q/qM1a8vDd/4zmOUotI8V4PdxdMLb2G12h
	CeMZxPk/fLt68OESwaSQKiYnWXjKowjBJ9lWtz/2fqb2xmXvEaj0TjGmr5ivkQNx0iZcuFEI4QQ
	DRr/oyNGhHXFcklWtfaYewFuC876GgnfC/F8R5GTnEN64pQEIGWMdZR/d+fvLgiFOxqTxygERgO
	k0xNrb8vRyRjaiubRfsm45OVncmcCowB81fRjEORe7SXXc8uasROgvx1qd41CuvAMKYPM/QTeQ6
	Xa0QFMGZsZHg3QQ==
X-Received: by 2002:a05:620a:472b:b0:92e:745c:6c5a with SMTP id af79cd13be357-939ea09214amr2042405385a.14.1789330727174;
        Sun, 13 Sep 2026 13:18:47 -0700 (PDT)
X-Received: by 2002:a05:620a:472b:b0:92e:745c:6c5a with SMTP id af79cd13be357-939ea09214amr2042400685a.14.1789330726641;
        Sun, 13 Sep 2026 13:18:46 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm20143821f8f.10.2026.09.13.13.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:18:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
Date: Sun, 13 Sep 2026 21:18:31 +0100
Message-ID: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa70527 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=8k6WQxmsAAAA:8 a=AzqT7FCsPe08lIGMPrUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX3R2Pish3W4xS
 GBsM3cW9ryHxsfs3JmPHI7EKJs/3tzQldzALwj6rXnUDbuwKOl9oqqSwGEuDKdTKFvPZHROGvbA
 E6uc5GY3wqIaWYMqVrxsTWUA0UyWvWY=
X-Proofpoint-ORIG-GUID: 7ETcfvouRNUBs_kILaAw9ZSf0pDtFYFe
X-Proofpoint-GUID: 7ETcfvouRNUBs_kILaAw9ZSf0pDtFYFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX+ESFoO/EIaxg
 M+ehnT7HFfy+UlXA/hDqlgDqwgscwaSQ3fwNfE4hH9yZQQbOPUnNy+izugN7ccjDnKH/xeN3D3w
 o5apTsW3YXoSxBRGZA/YEEbn5MXyZUK+BMg/198qzctFgEnbENqV0hOeLZCpx2UxkrhcQvYL/al
 7APlGjtLaJvzo7GB9TYmzpCTvQ2V4pgdfYoPw/GkSBsSrDaLms4maTrDjv/wzXHLUEAS7KKqx4F
 5ONZfEN8P2NEclCYPzmn46zHpVkIyLKme495Tw+rFH2ank4ju7U+uzgBMl4IJHAx3zn1qo3h317
 ohsnderAn9cu4MCoSxHHJAUw025aa4C6ihbil3s1xJzCVFruO4fEWJj76v4yuKjFErwWyFwHmb4
 Al/ho/ivHTxYr4r3CMGqL0D9gi3OtSz8Y0nHl0i4fCGZ2GlEQ0WydVQ2ZxXV//4lnWilI/ER5fo
 ffXAmNS9Ki5/0gg2k5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130288

Add device tree support for the Lenovo ThinkPad T14s Gen 7 [1], a Mahua
(Snapdragon X2 Elite) laptop, together with the drm/panel-edp entry
for its internal panel and a QSEECOM allowlist entry.

Tested on the platform:
  - Display (internal eDP and external DP on both USB-C ports)
  - USB-C data + charging on both ports
  - Wi-Fi (WCN7850) and Bluetooth
  - NVMe on PCIe5
  - HID-I2C touchpad, keyboard, TrackPoint, lid switch
  - Audio playback (2x WSA8845 speakers) and capture (DMICs)
  - ADSP / CDSP / SoCCP

Not tested / out of scope:
  - WWAN (wiring included but no SKU with the modem to test)
  - GPU / GMU (kept out of scope for this bring-up)

my working tree is: https://github.com/Srinivas-Kandagatla/linux/tree/upstream/t14s-Gen7
alsa ucm is in : https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/t14s-gen7

I plan to enable DP audio and other things in parallel.

--srini

Depends on Bjorn's:
  - phy: qcom: edp: split power-on sequencing by PHY version
  - phy: qcom: edp: update v8 power-on programming sequence


[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T14s_Gen_7_Snapdragon/ThinkPad_T14s_Gen_7_Snapdragon_Spec.pdf
Srinivas Kandagatla (4):
  dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
  drm/panel-edp: add CSOT MNE007QB1-1 entry
  arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
  firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7.dts  | 1184 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/panel/panel-edp.c             |    1 +
 5 files changed, 1188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7.dts

--
2.53.0

