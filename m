Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627128;
	b=a6XuN6ANHMVF4Al8IokF7Y5OgcQaeS8ol8MkwyZh9D7NxFCGtFY09WjcSBPLiWFE2ef4
	 LrCSwlXmqtF34GviHO8PgnIwpeNRCWG4O1mpd4e+Q42/XFdJcD/Oj5EWYJW4mIq5Rzq4A
	 P4WFkid/5BMy1gJVeijVEye8hFPhOY2RQdeI6UOeVgOBGmMGhWHo4UMBgUmAE5uPHan9+
	 EMECyOFtoF8DMm7W81v6ZpCDtMYzpVF1mifwNuniysHRMRBmCBHVl9yGUGZRvfpaiNY5D
	 Gn0nEZZAzDkOuBXWNBUcHftX9U1kM1CmSiOLiH5/ZsMDOWl8R0ZwIgkwuV5DWWhCbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
	b=jlPEwObws5/0Il1RvVJM+/rNoOHwG7CvxALx58B/i6Av5yNNpDUbw0FTIA7IajO67s9b
	 MabwXSR327n5/hsMGmDbhpH0OzXUA117mln18wA/8NwrD+6klTTco5sywKD6uo92k/WuR
	 iMVAoetPDVy2z/FjbQ+G0zC52ZJepIHPzW9jmkZOF0CDjb8AvvjX33plBUTv7ix60fh7N
	 F8Vs8otpv85k5eM9V6XRNFLH4Nz65sKGhaEz2pFuc+VtLYlyKLg20gsO+m/GkVWfZkSGU
	 ButO0tlYGeT+8uf9YnJFj3vrRvbaMYibq+J2vAS719SvM2FNpQdDd98JzoIhII9WDUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68271606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68271606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hV1dUmhF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIMibaY4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQPcD2375628
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBY
	z5UHPL5U=; b=hV1dUmhFcGwxiMvJ/HgN1LQ5D4biRwZWojEGn6SFkVkV9B9HpUU
	xPYZ8SBB7tyLjo5cTu0ivsCYXVZMaCahWfiaNP7E/LPo+YZhBNYvcF4roaJGjpjd
	p+uXejDi66RNtKF5XcvJYI+HhTe/+oJ1fhXiEL7cist8FU90ZxNSt7KvGzaSAQxl
	KnLlw2L/JLY8isXn/0fjX4CEUDEANYsVXM+v3RzEuv1r23xXmeS6OvEMM4pz2e3u
	dZ5usAb682x49tOVqi5vmP6LiugzZxGRbl4xR++KOevDQvNC9gerSnqLEFHIKHKc
	p0e9cVrTs416wPBv6svPixgUYQFz+cj2FhA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61args12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:18:46 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0bf2140b7so80327577b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627126; x=1796231926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=IIMibaY4iOXLrIukeWV8zFLzDlVnf0cEoXhVEErs7p11D8u4ypPfwTcyjc1pNzgO+Z
         1ZaozxIsonPmCMweLeppYWEnvCjDNvWEavT43cVlfha9cMcgj5YHc1LCKwq7rvoz6g2a
         YZBdR4PX5agEU05n4yleZUWqMfL486yPSPHksJO4F33RSiGWiq0RKRayTQSlDrfrdEo3
         edfm8HYUnDCwnff+NEq1pjjbSASY+opQFkGE3jCJGSHv2pmt6gbN6dFUjA3XQgmpNdCO
         mSSfVTKp9xPIHqbtN6tjE8S5kXoKVI8sI2xnvNCBtXGCEldPFg39WPHorFYfC3coSYqj
         cjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627126; x=1796231926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNK+/v/nYKWbc4K08sh3A9N1kK/Pa5xrtBYz5UHPL5U=;
        b=YEyCaZnMWImHNzIJmqWcOvVK/uDsQ7apfWounL+JuAZLQhT2lLSl48k3o14XbdY1L6
         nUMRLh75n9Zkbq+UOOOX9QjTpnCfgiwFzU58OLgIRFidXSadkmK31hhZ1L0MRklxlgX/
         h6SKerzxJkyArXSn+wGEydefXdROuhMwZ+7RQ1alKBZFe97q2PjD+dJeLR7Iy89agGvW
         FUdvcg7SseBWZv/hQjdC/c0rVruVsvyR7nYV8buPfUU1I8B2XOmgKYhvOgG12U+VgEk1
         8deYuQmv5dXNBwO2VXQoEvBQCwcqUZdFKgT8w9IQzZdKhMyEkP3SEtxNWgzEQKZ54hya
         pjXA==
X-Forwarded-Encrypted: i=1; AL+hErG98nTjWFtXVkPESGEY6xIQTX1Qx6DC0kUD8GuX01uwOdsdbwQ7bSfgPRrgw52Wpajdhh2/0YUhbDRH9Mgk@vger.kernel.org
X-Gm-Message-State: APuU4Z/DJ+pFb7Ji172+19rLSbeZOKvMTJl5t93kDeiQ3DXQbSpVXCWP
	rBrYQ+iUHkh2XEF1rAsN8HwR355sqN+jtNto7VizgYoFrQQYawlvv4ilnPdsI+zBnEb4YF3lP6s
	8jApNb0daqhr5gp8caYJ4AOSfAQ+OlK5K0xnIO0I1t9kUjzG64R90hsPoaAkVgYXc7A94
X-Gm-Gg: AZFdTZfbY2LTDfJkHIxHshtDq/rWSDDp0gdp6RHLvobxjasndw6dI7kNVz1E/1E40ts
	sFqI171URWHhE/xzhP9MuJcLAVUKYRQKSU28MAr5k6aafcOac+veb8wg33x1PGLsxn4BYoV2UQ4
	LsHYW52EjCL9BDMZX9pv+22e+LF/ctLVF2UE/ap4OqgYqacw/+oNx8j7xocaDL+7cUu5w2fKZW9
	o077oyYbdSWVxVvTMiZ+PMh8DNi20TIaMl76SqMJqauMebwQImUCyruoZCbFG0ngyekS3IA9FQl
	moBs6y/Eaq2Mt5TfJOnuURp6ro2K0V9Ib+oYityrIRp9KT0Yo7GqFaUXz3WbNH6ZeqF7yCx7xKC
	IyoomObR4c0ElptftENfR98jROcxeuBKn+CDSzFySgjy2SAu5O4pEmheVbIghMqYz
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127726d50.14.1795627125839;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
X-Received: by 2002:a05:690e:14c7:b0:677:b7a7:ba38 with SMTP id 956f58d0204a3-67df42b4d6fmr9127699d50.14.1795627125392;
        Wed, 25 Nov 2026 09:18:45 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm42096548f8f.21.2026.11.25.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:18:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] ASoC: Glymur LPASS macro codec support
Date: Wed, 25 Nov 2026 17:18:29 +0000
Message-ID: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-GUID: 14TsxdmwKqLLUmywNd2e0wSTP5DBWsr5
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b071876 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=OBTfIaPFV1-Q2Zl7jqIA:9
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: 14TsxdmwKqLLUmywNd2e0wSTP5DBWsr5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXy6VARgrSeAhk
 ynvhPuzONwEgyxTGBFRws07sB/EjXkDn9TOyCjkVy7QjKyTqwh1+qjRCeNReLqDDKRoAqmGeAiE
 7veX5Ot5TzI7Qb9vH05mjYVOEzW59jo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX3maHXE+Jji+/
 v8vJ9pFcn3dhIG+L99zJI4ZGR0mmPUnnVaGuuxzoUAzHZ9FDOa9fIrSw9RVNJbJg8EamAPaLfrs
 jKAAJzhEQ87oDSoAZ752v9WapBhol6Bv7nYt+rEGRHW6l/s03T/YW1nqk56x1j7Flz/u04vzyOP
 4P1vH9u0G/zjGSAfslnGmUJnvsIpMQob0sizbRKBgFgoQiT9yI9bYNTcgAxg/wyj3WqUmGL+f3K
 SI7pJc+GBSojuOD2+CuDb/rMCOESKAfQOGjKGhId6WjSV/+ChMsMeTyIcESbG/sV29fhWv5uowp
 zUsVaGOcFR75HJRgStn+Gp5wdx9lVK2Wd9i+VNN15b2R7FLk1Cw2OtVO6UHgETjyR+iHYhk9NnB
 ff7ILcttflzOUB+oD9R84tDncDkwedSjAITILGFoLkX5kJPlSHME70nyx8iQBzGd2XGWU4seAwK
 VJ85vrYmyghlDQRqJNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068

Teach the LPASS RX macro driver about LPASS_CODEC_VERSION_2_9 (the
version reported by Glymur's RX macro) and add the matching
qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro
compatibles to the existing rx-macro / tx-macro bindings.

Based on linux-next (next-20261125). Tested on Glymur-CRD and
mahua-t14s.

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
  ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs

 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 1 +
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 1 +
 sound/soc/codecs/lpass-rx-macro.c                              | 3 +++
 3 files changed, 5 insertions(+)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

