Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811599;
	b=h3FQB6k+a6u7dTmLWeZ/+aVXAhJco6x5HK1YNH/YP23X2FoBDr6zUXV4OoGZZmtz4cC6
	 JUeVKlYwZdLQDD4k7y7J4Z2VsRGn1cBSZvu0TVrOxXvTWWcbi1j3byLn7+Nfv9ddRM3u4
	 jkPzmWatOw8nzltzLz93Zvx69iN8B3HLk6aiEefUxTbZSU38+UzskNlZ7peIAcjlpNhp0
	 imw7qg18mEo5bPYpVT2RHhnvb/YxmqZkjH6XmDfIuNf5Pw8nl2B9vPzYagbo4mLLqA165
	 7y/vhNp+svMOmtvvl5AmkdbB+qRQIBYJzfndogT14H/GtgzVwhFRRsuIO8lQriVfSvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
	b=JJNxJbtFPwQIo5HsUMN/79ipOGgNWs/cOvpw+Se1eDYiGxAQeqRqRomSvxP8Oxk+rcBO
	 inMB5WIOwsUgkyGc+vyRe9kg6pKAcvGLk1tpr2/8QNSWKFcTqt4F3fxo84V02Wvp0j+DA
	 crD6zyuwfNXHodylO19ezKaEgjJVgSaAGrMXUUupctvh74K/6uEN9hVnCyddFKPvm0FB/
	 0+Ky3QLfyMq6goQDkgWslops+O31bqb0liRwiwRg/UK5fXW/v1FsEFmH0P2uBoc8f+k7b
	 6jnhsrhAoC1sCKTPaj1PsBfsLj9DpdtJ4R4qnDmxWDO5GmcnvPaNkdqEi/1ctUd1p2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRCEiFxQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfLkCp1T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638AD606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRCEiFxQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfLkCp1T
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAnI23346937
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=; b=VRCEiFxQxoYOSGdH
	G3uZ1VEiry+ezdUhDv2m1BlPtGH4U79T9/SHHUFOfYsJDMGEbycdFMgqrAbXdSzb
	jsR3KkUidJCi7snQ570dZAFH8G0kVtGh0RWZgMLWJj2CVqt+KgEtXE+OzCD373Pd
	R4ukBCHKd7AJSUsrYqE8+c3odSq7DdcVSwtl9IapAe0BAwSW+diXP+aZ+g6jyb4/
	+ozGPES8mvhWFqcW5bdAe5dLa2SIZ7kLIgY3p2UaPquUyah9a9AtEy1t/AG5VDJx
	n4HFlryr6rs3VgQF0o4GsvUf/SSq7vfLoHZoQUQvsOtGrWRzRbGhBsTicNeFwGsu
	SMQmOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhk2hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:33:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1523164985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811597; x=1796416397; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
        b=RfLkCp1TPpuIe3mQB5c6pfZU1UfiQtjEWEYHA/KUkBytAmjHX9U+JyVS/ju6Q2YQTI
         v17gHESlMBMZppfDQa2CvFdodYKo93lew03ThnOOsesuWH180UQYJQ9NoPKnsZLEGUVb
         LKtXeni2dlsZCi2/M/KR8wxzQaO1LrzffNfbCq6MmelniP2tNSpgt7a8z+GEd4QVcycS
         l1U/IR26xDCy75flcmkI8oWnsD2VEDdpm1p1Ao2G/TVzDxjf49n4kR2MGnZDwU6Trhy0
         KVMxqIXFUQLHVRiw/Hy5pN6a2dykXSL7xcCP/CCIJaO0Z3Ix9iC1ufvxgWFdqhptYFaL
         VgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811597; x=1796416397;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
        b=XmA+tX/ZuB8HL/wwXzmdim1LHdkYeJWz57ucFQ6vggvFS7eOwoRGJ6Xeyd2t47PH8R
         pESaKog73nU0RFuQlqOiHOrWVVXIQuBww4NKvZNIE1FCuQBzz76IQEgN1GIGiH59ouZQ
         Unv6IuEJ4syohe+8AIzq6ZZQ1WRaWIAs9kCESokfiD+0gSXTAvw0GwubEOjGDv7lmk/q
         97fzL+k5xUOYg8N6aCwis3lFTM7n7bg8dXHCZJ+NSNJ4oxt5itilW8CvELHrjM1Q2rUz
         mvHbjFfB4Iu7ySugvgCWNm7TcyMc0qSUZBWJNNG8PFzHw6kziuzmAB2BvC6wuBDbpqOW
         BZYg==
X-Forwarded-Encrypted: i=1; AL+hErHIBcCnrRWEk6BvQcgq0dHLbZQ6uPjQ9bDnX1oPc045pZPzIR1iJRCZRcx4yEOduYYULLdametmhkpE2OCC@vger.kernel.org
X-Gm-Message-State: APuU4Z+G5jXbPq306oULTZqMgnuaVxUkMDW21eHW+ILeFpDevgy1sq4W
	E3WiCbfajtDYRr7o3RWlm3p6RuTyTu7Jbmw5BnCg6NkcQUcgowaoQKNcc3dcTo+F5ISAqzqAMdv
	I01KM2IiCC5/hmb0AZMg1nSz6R3Rvhd/Bxy0QBDQ2rDzIecjQJuOBtmqd1x2BuDNWTdyR
X-Gm-Gg: AZFdTZfB4HklohUguJGgj0BVsia1pCBAoyvy9eFZM1dfuwfBc0sodkwq2lmIn57qvYs
	P4z9F03Xs1WSfmpllz3tIFnI3Resu+rMcutvdBO4fECrnT8v67jP2UB/ssrTHrAdxiUkTuz/lqo
	ODag85PpbkLFtIke2bz4Ocs7sjwlWAMViGAaMuNJJY1vdlzVzkMXuQJXi8P93SiXEQrds7TRwC6
	uKwkojlHGbC7CW66D9GbJ+b9PFn1GeexGgfn88XxcO9+vRGqw0R3nh5cDTkJw7+HPY7WbYckMVc
	AT014EwYgp8zDsOS5cArIfXeaKJJ3TpVwLQncMFj8wY7nBenz2gYfE/ZrjoDW+gEHkP660tmK+U
	y/AUHPXEnqH9+vDrEKXtJxZLb2xpkAFDYkBzUbdL+/ohnBg2Xcl6apdhIm1lCaA==
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4416937585a.58.1795811596735;
        Fri, 27 Nov 2026 12:33:16 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4416930785a.58.1795811596241;
        Fri, 27 Nov 2026 12:33:16 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm757194145e9.2.2026.11.27.12.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:15 -0800 (PST)
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
Subject: Re: [PATCH v2] media: iris: Support HFI Gen2 on VPU2 4-pipe
 platforms
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
References: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
Date: Fri, 27 Nov 2026 20:33:10 +0000
Message-Id: <179581159079.3905807.7535868776116331018.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=454;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=dZVlzXHIaOh9wqFfQSZFQNICJwCt4yuBTslnH2BoLH8=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCekKV4Omdmz5kzHIKBLrXk1+vAZNJb7tt04Dk
 GUa/EqkyW6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpCgAKCRBjTcTwaHBG
 +NaQD/9MPKSrOk2XJ9cGldG8chA0tmSFhTLp5rXvNQzag9wKaRzE+W5N0WYOqQEqFFqOobP7xgA
 NKXqh6abfoUmNVI7lkW01z7QYifStMCSQGgsI9iAB6CZxZ2TAsrEAdgKWIx3k8Gum74kJMCUCCf
 r49QKzBFeeXyVdQHB1dGLu1V5BUYjST4W7g0uV9fzDm0eCbGTjj3+z2xnUQaX/Rta8tiEksk61D
 UCq3+zfzlFswT2qPxTYPOqcj70ys9W5Spb8FaG/C53pw5n3uUcfpBuSvo3LzB6cNBZFNc0CQ6ET
 46fbU3LFYEEJ9kLsDoG2q5TzrJ5MFVC6arnxAV9XO/xjU9/w3xyDVlOMmthATF8LciRxfdoTT62
 kPChEZ1fAk/Ad7+1BFjd7AUKZNXjVqpJAwLHO9zhIF0xw1QUC5XbAdXHsy2BRFDAAaaDe+bnz9Z
 obWubKPeaM/xYfpD7wcXeGAO1XaqqwIj+Kq9VzBfN2ZNh17/V78dxEPwj2hgk/iP6GTLRyxs8i3
 Ewj5xKZTXgKGzW1R6Q38+9mKYjXQBpTeexZQUoG5EYpg089GJj9iNQsnO4DslqXy/j1X6maUlfA
 VqXZHrlVb9MKCbPlUhjFNLPyUIY51+ALfvbPKqesZJeJUV9IxU7zG2OiRLpR95NOEZU+ulOcUuE
 fcAU2Fu1PttGoMA==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX99rJUTdsfCiF
 XBWlG9OurAL5dWiPFD4A6SYncd5xgdc9T528WMREhmU3SecUl4fofJeqnB4HYAzvij8pJoZz0PY
 Eh+0KEcErkkkveIq83/IP1aWkW0tLCU=
X-Proofpoint-ORIG-GUID: nrbm8GEMmuXL1Tc-CqjNLRXNHgXDbWP3
X-Proofpoint-GUID: nrbm8GEMmuXL1Tc-CqjNLRXNHgXDbWP3
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09e90d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=F1k60asjd3FdZ7QOrLQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX/Bv3g1LVQL7p
 GagVZ9VZTXmzuoPAkCw1ezFZVSueF8KUlBj7yitWn54zrJtdxai+t63NP6GK8/Syfx7yr3/kI0O
 T+aBRaaSB7HY+G3342DMg/9r7yn52k3wlBPZA9ZUrwB7BQkgMMp9pXbi83MNCBflZq/0jbOUsJt
 INez1/URkjmcF4iTUUVBBcLxj+UyR91s6mCSuezoa7zlwT12qIjyViYt6LX+AivJTmH4YZ7dGpS
 oy1LECMWUd1Hk9y1Lp9aH/GYqYqN8EjLiMEw1VjRCW89ZQxuG1QvQwzdFLpwc39EXRpnoThVVah
 j85/8jdjKGZdOLlQTYwqUq+g/iAx2cONfIy637DZZLyNjaTxLkdTxlmaHL7xvugjoOE0FRQbcmD
 wIGWDvX4QFeQB3px3xuUD4PblnODSKGxdNcGnPNoYMysgfx2GjkVHEq1PvWqaZvXY5ZCp5U7TzX
 WyQNYeTowa9SNA0wz6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Tue, 15 Sep 2026 22:47:32 +0800, Xilin Wu <sophon@radxa.com> wrote:
> Some VPU2 platforms with four VPP pipes, such as SC8280XP, can use
> HFI Gen2 firmware.
> 
> Add the Gen2 firmware descriptor to the existing sm8250 platform data.
> This lets every platform sharing the VPU2 4-pipe entry select either
> firmware generation at runtime.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

