Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943818;
	b=lhtd08lsYiga7huE/sdOAr6yNYC9ZyvCdfPYmhiYfFS+mpzbkJ0kYuYhVUjJO199mREN
	 zhVfKxVSDJ6Q6zkJ1Jiec/tIbm161LjRNj75sP2uRXEYELEs9AU8E+F/StdMuZhnyI8Ew
	 i1IaYnIjeqp6Y8wNgBw5C/xabI8oWVdPk+cfnxXuBf64W7F/IZ53h9NpREBvEj6oa3Y4s
	 Lp4dJ3jwb3slAt0VSUQAg/79V3YDCePph3bOAosfVq4BDg0GkhS/aMZnvNPQSqOEsAWWD
	 9L2fZVFcFRc17Mlq92lH6OBZ5BD3vs5uT5JrUbHGyhcYxAyd3JJge4JNOUpEawxSjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
	b=U1GOxOGXgVV7f53n91BKRtcpZd5qn/A8z/WEZcCkozhpZ4W8vIv+kgeI6jodR90SzEXD
	 wey1qd/T7W+GfJtVgdUgR1XsK2RCC+c1h35nyVi3i2qOzoCCWU2wodXwiftSPuE1uOgsP
	 2I/rr8RGKke5tU/wiV85+P6TpjMZXZx3saux2QXASXycbYObBbs53fulaSScbse17ZONJ
	 qTdvXy7mArfsz10Dx96wxOKIe4QAD9ipNHnkUr8wTPYiXj3bFPwfJC/pADSjZxGTU/9/+
	 FAJNIJamTywuHu8nm3qhDwbwQjJbGEfxqYexfuFdQFZ3Gg18JsaWue5YqI5cAG84t9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpF4AnT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xlx8mvRQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C2606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 05:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A7C2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpF4AnT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xlx8mvRQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xtpb1866654
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 05:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5
	p8HUJucI=; b=LpF4AnT9qfz4uoICQQnJbcr+VttSjVrZKi03KtqPSrsPeQLU07q
	BZvVdUdbMpQPaLKJYa5lfVRAcOxpo+uka74U9fSNLxM5Q5xRvAo6hNGnIwg49zoX
	m1r1udMMaM323hPKhiuQ7ObhFIVr72rZY/JeNe1MJAU5HaV+UBhp6hSGxY7tWdFu
	JlV89MTS51CMf+NZjrlhzwrhbRnyp6n0Y2EfHb9g2cnldvc/zlqwmBnIDeVV7Ytx
	E0tj6N0JPetvkHrOMM4640DZKAJaS1uQu4IY7DI3Ezt6RSVJoYfQuXzh3OBq1lor
	1np9rwBN9I9kFJqxEWLKZvTyoqUPzwj0JWQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p994dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:43:37 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b3030bd581so2890127b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943816; x=1794548616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
        b=Xlx8mvRQaD6ABKZa16oTBupzF5Akjkkh1XR2v2JcpXC7ODruaO8hi+C9yOf4bkbXsu
         8pq12jh9fJ82ocW+Hy39Goo9sGnd35jbE9QgABNtBV3Kd5HrO1ntmlYdIWr3Z6rvOlOT
         bR0cZ97ENEr7SrcTjuKOXFsU/lLsb3M/RzliWz7vlj5h/H2EZghMPur6ofqjLkSWWgyg
         QbgeIkn+7zBio72hCi8Jgxrqi5uQEU23oturoE8TQGhAS5M9ZqqgVkXpufQ2unsGbX2x
         ODF6BurWBJEw0CAEZ8nis0d9stTJIIkt9wVx2OuAenzZ+/tHRAMmSwq7Nr5JFLq/+XkJ
         Iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943816; x=1794548616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
        b=C3C8GxSneLIfnIqU0rZBJBzHz7Se0ZY4Fz5YWvsJet0JGMQH4zq+eiAmtTMB+qxeO1
         x7iS9uqMP17/aeFJHqchBSG9VybI/uUEjRVaGu6zzm4u6LI2Fd1jrEW9irE7cDYacwp/
         bwazOp666UtCj3//Oz3fpTjfEzafyJIsAXRdI5VqIW/URqUbKh0Ycqgntq30D+lsrPA5
         vWpWcLS6f8kc1VnkUw5Vwdabn8R9PRxYS0dq+4ggDLJjkXxaRZVb9I2JyFXGy313Q2Eh
         bIUw6l1cwN7yeHQB+4zs9NhQT8MmUVLs5ArTD9pQ13ljNEs0Cae8Q1H2B95goQNBQhEq
         Qm7Q==
X-Forwarded-Encrypted: i=1; AL+hErFmjuALzWb/ntKEWCem5KTMRk8NjdG9Ucx5nFKH8dAHsZUTrVV2/wMTGLRu1f67U7T96Bw8w/eSbl2NBXim@vger.kernel.org
X-Gm-Message-State: APuU4Z+BeTlOjFe9GCN2mf1/jHbBvveNlUWDF+a/NcU1U5EhJZmhWYGz
	D+Dk1wc6IGrh02JdAMYeYSdKiwAUnty4S/e4Mk5dn6643Bq/WW/4AZIQODnpKes/7BR+9yPiktP
	6FKZuoh95ywAMiPwwLfLSro4G5sRkyg6syA4N9xN1u+LZIjuP+Phxvfc4I4hZjwEVbOYe7yPWU3
	6m
X-Gm-Gg: AYBFou2oQ90nC6idH4Sr+tyXUZJRAIbLuH2zGZSEe0jngcheeD/mJnNIE3GZlhw03/I
	n77ROueDUPFTub1lphu87oJKBchJuZhadwcwHq2z2kai3tI54mb48W9zxOYKhUTBO1jzlGmc2sY
	jKQcrE2tkAGGMs8wPUVsJbDnayEBujSyYL/wQWMjcUSrYRPJiQjjJU4TcZJf8aY/XO8GKMnOSjm
	k77XXHFyPEHydNYTXYP6YbmtHH+z5JDygvnXcVIqHaHY4L7ywtcaw0fJ+nzGhuC7rM8WqjnfJ5L
	3YJkecD83HPJGybmUYZcc1YNz0B8b01R0rR8mHoygODvnRFQ5Ph4HcJnPtYi4ptQlGsg64jgNaO
	W0KskhnPViS4MswklO7JWuJpF2ercgVMfxC4fIZMJ1Den84CBvln9eVqNNtPmWlO6GRMvW2IXKL
	QMhfszG9FqdsP+h6CtEvId1bSVIQgtL4dNUQ==
X-Received: by 2002:a05:690c:f86:b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b341b11f7amr7066187b3.96.1793943816208;
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
X-Received: by 2002:a05:690c:f86:b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b341b11f7amr7066117b3.96.1793943815822;
        Thu, 05 Nov 2026 21:43:35 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:35 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fix the x1e80100 card after an ADSP restart
Date: Fri,  6 Nov 2026 00:43:31 -0500
Message-ID: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-ORIG-GUID: tNNCHNcfrZatiLuvdYt1XlpW9pS-_AGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX+0XOnUczDPsD
 3jsZM/33PIQ3SBp2v01hYRYwyQdH3tkBnaZe8iZB5qZjFKKnLn3wqo385NK1DtNg4I8IjJfdP7t
 hzZ55/3UeVbDAKlGosdVaxROeZMW+V73mVwt+ldVYrIr3rUaEEsR8ab80gCEjqlszs8a2r4Pm6u
 HPXTw+/P4ZZImir60bBjpYbL3gjcuxaWRYx5gAa2h5b1GmVwY/PQidoNlXBV6oJb+rV+6cvEqqO
 3GfaIG0UPn4gOASeUIjz2zJwjaEbcHFCD0vRIQN8MnWUHVjaEEQphl+K4yDzCppOVWgMaHphGK2
 uZPNucHe7Jqy4+/OO2NMkKnbu+00KptEemautB6oN/jZdWH70vJChkQpOVzfUfylXkIBWNv2ZfQ
 3C3P4guAzQ48zWKWpAkZohU71IdIMLvCv2Vc8U0ADoMqZniawPS1xSFoTRXY6OIllHIAw4F94yR
 Ge660Ssjquslrtx2Vrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX5TQ2EY4yzGcs
 r5IUfepLzIEXcDHCoh4jjmEt2VHd8HWSGoNbFMaoMNv4FVWrw3xyUUiZab+XTUnZ1CpEJ1xTYaG
 K3shv3aU7/X2sVEzBpqZPGstslI4qp0=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed6909 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ahqmK09zdcNxaaV6BQIA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: tNNCHNcfrZatiLuvdYt1XlpW9pS-_AGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

On Qualcomm boards an ADSP restart unbinds and rebinds the LPASS pin
controller, the SoundWire controllers and the codecs, and the card binds
again once they are back. On the Hamoa IoT EVK two things break on that
path: the DAI link names point at the SoundWire controllers' freed
strings, and the headset jack is never recreated.

The speakers also need Abel's reset-gpio parent fix [1] and the
gpiolib-shared follow-up [2].

Tested on the Hamoa IoT EVK on next-20261103: ADSP crash idle and
during playback, the card comes back with its controls, the headset
jack and working playback.

[1] https://lore.kernel.org/r/20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261106052851.2741296-1-tyler.baker@oss.qualcomm.com

Tyler Baker (2):
  ASoC: soc-core: copy the DAI link names into the card
  ASoC: qcom: x1e80100: recreate the headset jack on card rebind

 sound/soc/qcom/x1e80100.c | 18 ++++++++++++++++++
 sound/soc/soc-core.c      | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.47.3

