Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364092;
	b=Gv005sWcEOgBZ65jgf2fk+D5NXzMoKwCAsttsP1VtcjUqyeBAa55dnNMJguTdkhPnc86
	 pw3HN4ylibqP7v3eZ7bZbotyUFZG3w2YrR2B6gs2iz+X7+qYqmhwyeCIuN6OQXT8D42jU
	 IopBY9KjgvbV7cO3uFj22LI/bTPa92db6v1pf8iSzlQixkYt62v8Pq5VIiyIXoKludBEO
	 SaD0rTBQk4NaSvXOmyGD75swjEr3eDGo9sI4vpYki/osC3GWG69fHJsvMOVWnAh8y1AKe
	 b+SK2hto9cUOQhU8QrjsfXBHdvpYbBkTAI2XgSPshjGRB36HmWq+jMRQ8kvTTBZc/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HKL7pXgslxzbEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=;
	b=G+bvJytWNNj073VekzYnP812Zv/elT95het3ntUJ8gPkbCX6AjNwPJ3qv8faSB8JrvRA
	 jCV5O0avGtBrQHtcnEq7g/8ivBk7frOzII8tkfBhD2dpl8GkZKJwUUzQBI8+ki4W8ig2l
	 vOU5eVoz5JAukqakICyuVOWQCAe95sUp6dZx8gjFLR3vMw2NrzvRyVu9DWoS7R8A+rXO1
	 M1il3OT2E+ZswNSTkuB6X1SIjXCs3hJTmohNHPmh//dO0EcfMwVn37o9Jthyu8KhpurlU
	 vZXOGMCVlOb/OQ5axKlhg+jRUIkiKTRpJUjmIFPR0Tdh9XAsncpjaaSYt7fCrfLWUfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEOV7+fA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ak29ljAl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90844606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90844606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEOV7+fA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ak29ljAl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQS7Y3853066
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HKL7pXgslxz
	bEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=; b=GEOV7+fAPT/JX5zd9XudldeXeNF
	iCTPhCJK12Ue6HmJCdfTV0dopwqd23opyWAMgsgJI6MxJ43HymZuWDk66yeJePrq
	L+Zqt1MYVVHcp5QX4fHTK51OaoclzrUyF3q/zDFvqCcGz5uclYV7ycMkoQXsxFN+
	6lTw7D9VNuA3HM5H1xLRRofbHSDDEsfgsIumynGM2BNzv79cv6zKLrdeL0x+/eJd
	vcgFL3jB3hautRdLpuSfkAmBZzTIh5TZ5bJTHK9b0ILmD99GiaGw7ekZO5CHhnup
	+cTcN0rBm0Mml0Jk9aSUvSCPa6M4BQCibrpiss0ms16ULtLi3CH2JOpXFYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3qy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 16:14:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94970ad532bso409333285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364090; x=1795968890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKL7pXgslxzbEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=;
        b=Ak29ljAlyJLiqa7kFoEs+ql2mckk7hTwbpGmTdYgp2meONogEt/eWABhI9VDiY6C84
         fkIiXhQyHhx/Qve9+QLYz9baPhOW0YS6DBlzvY3cmTxiXvqpYg9XSYXC2UJsoi0lX0im
         eXVZAbpibb33bzuDBLZOk2bbRzDwOVXciSU/NdCmwQ6L0gKgLoRmneX0hsWl8Rqy2hDk
         /Zlrx1inzgI6b3ERuJlqWB7SeycZqOdER3NBzgM5CnomaLLXom4LGI3YQF2jU+jsj1po
         0idKJ0qVfGKSzQSBG6SDT5UPykd1D+tGE23naa43tZ+na0a8quMoVViegIN6x0z0PFuW
         i2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364090; x=1795968890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKL7pXgslxzbEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=;
        b=R4Fh09VnJ0AnS8YgXr7Huul4bGhAkcr9W7d67EUfPE1vSGFsHosVPYbAU/UOTlqBGZ
         3/wN1fWCxuP0cOCdQUkPNASH45Iyep7fgX7fqW5/7GH2HScuijTYm0ts+5ShNa4WD0A7
         c0uvfipUnYQzS300r+dei3Yic0SBXuxYbfowrZ7evFOfzngFC5VmZzAZ69oiOm9z9TLp
         az1wOoWtbgIT4g8ahDOqvu3yPPtQIW78jeINVRHf2+kjbj0JpRVxjVdBYcCdNkIU8eph
         uGX6o+CdkpDNk7/H7zDOz4M4KYQm3AUXyB9GX2KJJ2iqIyrldNNkBwlmzNU0YcXDuGKv
         XaWQ==
X-Forwarded-Encrypted: i=1; AL+hErHAe+tEEgWJocv1liGlZUZ2G7Bl+z6iDYy21N5sqrdhzfOhoUVT1oWoLp2j1OviPisboRdZOPbAGgGcvt1l@vger.kernel.org
X-Gm-Message-State: APuU4Z+dLCgFqcwfWejEp6ExlzrqpFi26vv3XVHg60o/JJN3TY9hQqyw
	/v0U9al5CyA+/lOo9LOwFoFTeh8twULasakM4hMzDm/Q7+s4TeMi4G/bohZrNEYbs48nmE/t49F
	ML3PW2birtyrsBuzJS/66ag9H3wTUp22Ux2A8DHcSvS0GfSgRPBvA65UHk6orImcmTcjw
X-Gm-Gg: AZFdTZdLrU6K/Kb54u2adlNl/sQmrwO3DuCk+JI6gwp1qL/sO49hLTCRtzYxgwIApQy
	EGIqqpDNqisMbYqGxXF4GE7nV/I+CjZBSp9JoC87g1b6QROXADBRSYUu/HZONrh0UhjWVzVNOuC
	I7oWH177TyJ5uJ9uz4GQmMeb7x59yDMBj70pegmt6B6RyGMnaw1kqd+jd+3WcqqJuSXd8ZjMkN5
	aLm7ewtulnP6z50MW5Tu8BKAzetHa941lCotyOwVRSl4VYFV0RVIBUdPj/+WhIQAiNu8VcdNoGG
	UXlWQvzEcblyvPybITIPCT/tqRGYufzVA51JH93rUqU0cQ2wDMFIqhmHuehdh2r0Ex2nXOREN/L
	HCvl8SJMEI5wkwlUErLp32hzc32q8bFGWK7bHkN4Ie4LfUzAlQtZJGi/jDXG2ZnWf
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr1407654285a.76.1795364089661;
        Sun, 22 Nov 2026 08:14:49 -0800 (PST)
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr1407650685a.76.1795364089135;
        Sun, 22 Nov 2026 08:14:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 00/24] ASoC: qcom: AudioReach Active speaker protection for WSA88xx
Date: Sun, 22 Nov 2026 16:14:13 +0000
Message-ID: <20261122161437.5994-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: hR7cTnqvebKV4LuR1tk_YHm36QTC_lPb
X-Proofpoint-ORIG-GUID: hR7cTnqvebKV4LuR1tk_YHm36QTC_lPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/2bzqvUjD6RL
 +6QjSdZzBwgbpESuH6eP+bfBH/RuYTRAhcavnKb91xi/YK8fcUMuzgEx96Oo2cXatHRTdD2w+dz
 V/f9hPdhqv0AB0ZIb/aKVpvIP/uA7xEtJ3Ik30Lqz1CK8Q1aklstWPW4lY4PK3Rf/rI7f8gMRPO
 powGdG+6HDvJggCJ2VCsDrVe1DQmKVJ3yLvOlD0pZe61zvA5a6uJyIRWve82JE+b5q+tnM7BvJY
 uRYSywvqXNdLqrqO8r4DSgNib0karT2wvvimy/znWgMjpJ/qLXckn2jmqfqcRz17o6UBvBDEWRl
 Hy/YMV6UF5HjBObGSi8B8K47T0kgVlPs4CPGFXe3N4Y0WGdKVvLAL+3NhaB+1fPa/kovuukzQjT
 t9mbNJzNtDDfN1etMsNuPcGcYuVpwniqYJ71TINDCHiiW5b/eP4c3xYidazSszIpHeMBgQzKs/s
 ZYK3gHzs1mo32mu4p/w==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b0314fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=w_6aJf39JUbkyodHB6oA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX57lTwUtOHwNG
 dOro5unfImV0XV1Z74AQos8FrFg6spY6QjRlXWTRKdHOMmchHyCu1YS+r/GTzkOaS61cIJjjpC+
 wDeodgzNVp9Hjz4UQUZGxLJh+2jT18U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

This series adds DSP Active speaker protection (SP) for WSA88xx speakers on
Qualcomm AudioReach platforms. It was tested on the Lenovo ThinkPad T14s
Gen 6 (2x WSA8845), T14s Gen 7 (2x WSA8845) and the Glymur CRD (4x WSA8845).

Speaker protection needs the amplifiers' V/I sense capture running
whenever the speakers play. Rather than a separate capture link that
userspace has to keep open, the VI codec DAIs sit on the WSA Playback BE
link, using a new multi_direction codec-codec link flag that makes the core
run .hw_params/.hw_free and stream events for codec DAIs of the other
direction.

 - ASoC core: default ch_maps for links with more than 8 DAIs, and the
   multi_direction_codecs link flag (documented).
 - qcom sdw: per-direction stream runtimes on such links.
 - wsa883x/wsa884x: VI sense capture DAI, die temperature as a thermal
   zone.
 - AudioReach: control links, VI calibration run with per-speaker
   events, R0/T0 cache and restore in normal mode, static cfg blobs,
   mixer controls for status/R0T0/live T0/calibration state, and a
   "Speaker Protection Calibrate" trigger to arm a run.
 - x1e80100: VI feedback on the WSA Playback link, speaker thermal zones.
 - DT: VI feedback for glymur-crd, mahua-t14s (Gen 7) and x1e78100-t14s
   (Gen 6).

A topology with the SP and SP_VI modules is needed to use it.

How it works:
1. The topology puts the speaker protection (SP) module in the playback
   graph and the SP_VI module in a VI feedback graph fed by the WSA VI
   sense ports, joined by a control link.
2. Starting playback on the WSA Playback link also starts the VI sense
   capture (8 kHz, 32-bit, one V/I pair per speaker), so the DSP always
   gets feedback while the speakers play.
3. Calibration, once per device with the speakers cold: userspace writes
   "Speaker Protection Calibrate" and plays silence; the DSP makes its
   own stimulus. The VI module measures each speaker's resistance (R0),
   the driver records the amplifier die temperature (T0) with it, and
   "Speaker Protection Calibration State" reports the result.  The mode
   auto-returns to Normal on terminal state or graph abort.
4. Userspace reads R0/T0 from "Speaker Protection R0T0" and saves them,
   e.g. with alsactl store.
5. At boot the saved values are written back (alsactl restore). In
   Normal mode the driver sends R0/T0 to the VI module, and the SP
   module uses the live V/I feedback to keep each speaker within its
   temperature and excursion limits.

How to test (card 0, two speakers; for four, use aplay -c 4):
1. Boot with this series and a topology that has the SP and SP_VI
   modules, and select the speakers as the output so the WSA path and
   the "VISENSE Switch" controls are on. Stop all playback.
2. Play one second of silence so the amplifiers have been on once and
   "Speaker Protection T0" reads a valid temperature, then wait for
   DAPM to power them down (about 5 seconds):
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 1 /dev/zero
     amixer -c 0 cget name='Speaker Protection T0'
3. With the speakers cold, in a quiet room, arm a calibration and keep
   the graph running with silence; the DSP makes its own stimulus:
     amixer -c 0 cset name='Speaker Protection Calibrate' 1
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 15 /dev/zero &
4. Poll the state until every speaker reports 4 (success); 5 (failed)
   or 7 (timed out waiting for V/I) means retry:
     amixer -c 0 cget name='Speaker Protection Calibration State'
5. Stop playback and read the result.  R0T0 holds R0 in Q24 ohms and
   T0 in Q6 degC per speaker:
     amixer -c 0 cget name='Speaker Protection R0T0'
     alsactl store 0
6. Reboot. alsa-restore writes R0/T0 back and every playback runs with
   protection in Normal mode. The kernel log shows the values, e.g.
     SP ch0: R0 3.102 ohms, T0 45.000 degC

Changes since RFC:
	- addressed Mark's review comments on ch_maps (clear
	  dai_link->ch_maps on devm release) and on
	  multi_direction_codecs (codec-side stream events, scoped
	  ->stream flip, symmetric hw_params/hw_free, ordering docs).
	- split qcom sdw patch into the snd_soc_dai_stream_valid()
	  export and the per-direction rework; added wsa883x VI DAI
	  for T14s Gen 6; wsa884x VI DAI has its own hw_free/ops.
	- replaced the Normal/Calibration enum with an edge-triggered
	  "Speaker Protection Calibrate" control + 60s watchdog, so
	  alsactl restore cannot flip the DSP into Calibration.
	- x1e80100 VI params fixup: also pin channels.
	- moved DTS patches to the tail.
	- tidied up the VI calibration commits so later patches do
	  not undo code introduced earlier.
	- dropped RFC tag; rebased onto next-20261120.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the bring-up and
to draft the code and commit messages.

My wip trees (kernel, topology, ucm):

https://github.com/Srinivas-Kandagatla/linux/tree/glymur
https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/glymur
https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/glymur

Ravi Hothi (11):
  ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
  ASoC: codecs: wsa884x: add VI sense capture DAI
  ASoC: codecs: wsa883x: add VI sense capture DAI
  ASoC: qcom: audioreach: run VI module in calibration mode with
    per-speaker events
  ASoC: qcom: q6apm-dai: add S32_LE format support
  ASoC: qcom: audioreach: cache VI calibration results per speaker
  ASoC: qcom: audioreach: add speaker protection calibration trigger
    infrastructure
  ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal
    mode
  ASoC: qcom: audioreach: send static cfg blobs to speaker protection
    modules
  ASoC: qcom: audioreach: add speaker protection mixer controls
  arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback

Srinivas Kandagatla (13):
  ASoC: soc-core: always allocate default ch_maps
  ASoC: soc-pcm: add multi_direction_codecs link flag
  ASoC: soc-dai: export snd_soc_dai_stream_valid
  ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction
    links
  ASoC: codecs: wsa884x: register the die temperature as a thermal zone
  ASoC: qcom: audioreach: add control link support to graphs
  ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
  ASoC: qcom: audioreach: add live speaker temperature (T0) readback
  ASoC: qcom: audioreach: add speaker protection calibration state
    control
  ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE
    link
  ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker
    protection
  arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
  arm64: dts: qcom: x1e78100-t14s: add WSA speaker protection VI
    feedback

 .../bindings/sound/qcom,wsa8840.yaml          |   5 +-
 Documentation/sound/soc/index.rst             |   1 +
 .../sound/soc/multi-direction-codecs.rst      | 156 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      |  20 +-
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  11 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  18 +-
 include/sound/soc-dapm.h                      |   2 +
 include/sound/soc.h                           |   7 +
 include/uapi/sound/snd_ar_tokens.h            |  13 +
 sound/soc/codecs/wsa883x.c                    |  77 +-
 sound/soc/codecs/wsa884x.c                    | 165 +++-
 sound/soc/qcom/qdsp6/audioreach.c             | 818 +++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h             | 105 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  16 +-
 sound/soc/qcom/qdsp6/q6apm.c                  |  42 +-
 sound/soc/qcom/qdsp6/q6apm.h                  |   1 +
 sound/soc/qcom/qdsp6/topology.c               | 313 +++++++
 sound/soc/qcom/sdw.c                          | 225 +++--
 sound/soc/qcom/x1e80100.c                     | 100 +++
 sound/soc/soc-core.c                          | 101 +--
 sound/soc/soc-dai.c                           |   1 +
 sound/soc/soc-dapm.c                          |  32 +
 sound/soc/soc-pcm.c                           | 136 ++-
 23 files changed, 2159 insertions(+), 206 deletions(-)
 create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst


base-commit: 9af49ea13d5e2fa82c0067e48a135d7c6cac5825
-- 
2.53.0

