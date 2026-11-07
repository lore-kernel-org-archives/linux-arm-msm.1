Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013694;
	b=2WadsuiOYhg6SpiWCRsfTpvNfqP44y7W9SyoJRDCfxzlTBAzNE2oBJgfrW5Y3Kv1rZK6
	 qOARntVVePHqJ0xBVBNpdeshy4s6LoUifbbJWqC3Xc417wMI/aJNMg1zwGCUeoz9fQiNe
	 agNSm2PnhcCA8XmO4pjNnCd5J78/UjOXVi9JKXKWScVXPI0g2UNW0dtWhdEhDAwFB66sb
	 N72wCN+/WTWLn3DzSM1A8TYOLRr9s3jgdgjhdF78PfEC4WPbHnuceo++iLe0JStbSDcBW
	 iddwFG4i2nXf63+ZcOfi3vOGuVI+yrCySII17m2WmU2ePeBGc+nIhUCDJ813NrJdPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
	b=lupzsbAtfyeNPwaHKpJI4Jnyc6WYldlfYDZAKgu7Eb3Go/6xTAuVZZGlmV1R470sjRMg
	 1OG1OKqArZnrJ4lBcUyJ0fTzywDKhtbRYOrFaf1TO1LVHyEuHQRGu866chYN3pErmyBTU
	 OKA2OO2SnxdOdQ2LV2CYivGYtPjrmjlxH2lmo1x4CB1wsXRwbO/h7RXVWSbU28IGjShUD
	 0qXI+eg4ykiDwYZ4B2v50eVVg/1p2MzksDw/INMZ3NfdQhQw0J24bDlQSMXRW0jX1/i44
	 20nK8YGY3Z2OJwkx4S1LzOHYtihWsJgBbkxgE41i8Da5pHJYtUvr9QDMU+rAmJtaw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jbim5pNr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eNWdvSsO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E8606A33E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140E8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jbim5pNr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eNWdvSsO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A70JxqJ1295646
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 01:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqszqiOkBMd
	k1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=; b=Jbim5pNrPgMo+g46DRYZjAFuvhE
	Vr6G6u9Xl5bnz6g9WcIHzXufPefgfrpxGPN6+vQM5xK68i+VNDmTKdw9HS/3HT7E
	sLN064N8UnOJczaLEC9w8LKnUZH7XnNcPLBssD6EHqSoMAdVsR2TxiI4MSg+JkjY
	mE1v9RWM3WcNptQ7Uy7bBp7qLwVyekdd4qyZABfxq0rLy/iUKhM5MmsPVUGYg0um
	WTs1NCVnhnZX5QmM8/Mlq/Asxv7XhAr1SRQXkGoIvsvFcm7B5KNBOSVViIWaGRiV
	hyYdf57huav//qkoyn6x0MitT+TbwufIsIdrYAHV0GNppL8ldGIUf3SQ94g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnr354-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:08:12 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b346e49674so3852017b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013692; x=1794618492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=eNWdvSsOdHJXwWXCsrFCmvbjZW7QfEYhoO6x5oXoNwImpk47ECiEFu8M2lfPdaNJcI
         Vn3l55g59SQABCFlKZGOpZx33wbGe9KcZ2qicf/0cEbVKkceFQF2a9Pt78ja538xixTc
         J1/KmgHGhRYXLfkeac5xuOP29ZKTCKHoZ+rovUeoxBD2zfi1GmOwWnUz3oW9DD48ySeU
         sdSS4S6ZTv7sm2Z7ibxg/DuI7gU9+16ZbDMiDWMJut8cov00YZxRDX5nOVD8l2b/+stA
         Nm3GTc+hWjBPkNgB6xVXH/wgGqua2evbEJMwr//BtX9+qt8rAZhK7Jkq8RDwYxnEaI/5
         lADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013692; x=1794618492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=zie2NLSymNI2Bh3YoTAmac9ijldNujYEUdFCey/Ln8s2eMZvJU0HYaiPRAs/xf/DmG
         6ukLRbFeGGM3/vgcB5wIGLE/kQsqGdOEpKQj4ljadLF9eI/sPQxpPPif9LrmVDw5+wWM
         ySLDrjNEbSclAQ7I038rbd2LQAUcS+onIZBZnmq+keioadWb0LJXZPVYs+pIjomRB6uJ
         hJ4hxdpNTqryk1KCtXbi86NoNW6lF6sZ12kzBvgv4MKPd5s13k1wYJRfFts8nAir/fYQ
         C5wuS7oWHghnecscOvZ+FFa56DQjyOfI0Ud8YqqYOxNPuvDkVfgGOVMCIMayvYrzroyp
         4uHQ==
X-Forwarded-Encrypted: i=1; AL+hErHIU5xn2IMwuri45t5bHFQMxIXwcOLBs1WVYuBD8+dB+Yr1yaTyf9YdU6PPZ+ohbRdvUjYBp/OLqyVqWruR@vger.kernel.org
X-Gm-Message-State: APuU4Z/annV9LasMms/snPaq+E/9lro2D/w/1JCSo49e0la+OFB72U1I
	tBlSC2daHTtotnM0wXOH+xw5MOBvmgpoiTWE7iCVPHzugv4+A61dFWZX354m0FQUcwsNqudoXeQ
	iFt0YS9XjjhIztWbeWr76240at80uCGEtxa/RvXvYiWcSNnGleRkIFT5ErN83G+AhL5NF
X-Gm-Gg: AYBFou3+Pi+WbkQBqWJsguIcCDPN9+pg7xFzX96rGsZ6yK+zT2nNq5V6apFElnhcXOr
	qvU9AcxjqtV2ji/ZUzQgjmr6ykxUjQQ6t2rEplP55rvSQM0UtRim8KVieFDLRFTl+1U4VZDJ9LD
	t1u4aQFoxy/VZ6wHrqg5MMn0ViIdOO4Kl4abNblyjgKzo4rJHAkomHkmxh6KqQeqqPB4HKL7xpp
	QEITUwRicT5Y/PRRIqSBrQIQ84sGv7cs7KylxGUou7x6pXr+xClLeoKESs/CZXj3K09sdw4S+4V
	IiaSG03Z3V1JrhUqUvRNDJlVAm9soL6esPZs+mPWvj4EOLIgP5dqLCZhUjZP+2Tb4eKhyLXUYdC
	L4DvtSBPT9Tn70cfZuZ1arCapVoMvYCL0WszfD2lTGs0Kl/NDzQrpiQF86qO6CIGZulRbdlFc4c
	q4/d/bU1uC6JDyDn9rrVCb7gifWsN/eb/9Xg==
X-Received: by 2002:a05:690e:438c:b0:67c:f8c:22ff with SMTP id 956f58d0204a3-67c29d038a2mr256560d50.29.1794013692358;
        Fri, 06 Nov 2026 17:08:12 -0800 (PST)
X-Received: by 2002:a05:690e:438c:b0:67c:f8c:22ff with SMTP id 956f58d0204a3-67c29d038a2mr256547d50.29.1794013691939;
        Fri, 06 Nov 2026 17:08:11 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:11 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Fri,  6 Nov 2026 20:08:01 -0500
Message-ID: <20261107010801.3451213-3-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
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
X-Proofpoint-GUID: HTCgTXtRqadApzKGAqKbHKFEEWwsJxsf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfXwmpn5O3QVkgX
 Kszdgi9cF+G8po7eAgwBLADg1yUvH1usA+qbLcWLkN9AUAWGT+5ce7B553o5Hk7G4b/up2uKQB4
 dRiEu8O95naeRGsxdxkUgKgxoJ5aJrJnkTJO8cdr7DnU6EUh3GeKjtGOZFtDdOS1Y/dc1akjRc0
 tyclF84J1sOb0rumU+8fCddPJRU+rk1kmD8ur0Fc36Q2LpyG5YDz/xNyCgdmDZA7IpDXPSHB6Mz
 lhJtquKXfcwx6ulj7qgyHi5kBFZMrx8DCmx2s2iiv/sEJ6+B+SVEB2UFfzUiBoIN9KCrpejTyPo
 SxJsuA6fYf2jXQN9dYl4FLAf8VouHvE175a9E9McCaC8d8LaogOAXNvc8t6rrU0YF/uBOB+wKLM
 gXIyNOTPFyXExhETXuxpFWddXB0KLGnLUBymGVOSQZ3PRBa4HiSBL7UIS0InTDhOokQF6A757RM
 mUaQ6TtmQmtnHypaaQw==
X-Proofpoint-ORIG-GUID: HTCgTXtRqadApzKGAqKbHKFEEWwsJxsf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfXwAOGilh8pkHz
 MEhbX4gZN+hGBKUueKkbAkYGlvESl+BrYICcRaDYKmMzI5jvVr53r4qWFNcOa3rtw7H+QIb1ubN
 uyjwR/KBu2I2nVlcmd8D0e/qufByTV4=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6aee79fc cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fP8dIGKjERIvVM-sKqAA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070004

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
