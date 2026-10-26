Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020721;
	b=k5+Rgtqc81+kUQo/PfsIYuYUL8aQNIzBpLmVJH0V6rDxUhh0iHC/xjn/bJ6s+Appp8b+
	 jN9k0pb+OMs3qERLSzn9Ulvobt6y2NIrOtXQgZ/cGM9lkzh7xyrE5SQzS8DjpLYeqRP/1
	 IO+LjJN9R3BZsQ1f3tZ4IfuL7TifzW85oDvkxmMJ6wLZZxusigT63/1d9eHSBvuLI2RTI
	 IOA+YEGPYOqDNWBcCAuiwHsfnQ8Oe0xfyNZBv/vaWTSGmwA2GlNJc1Sfqz/2vzQ9JRBFb
	 9aTWwJXV+V8w5T5omzkhCNzO+dQ3GUpM7p0hT0LOwNzhqBqjfgY1SlfDjSyUWBw1iAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
	b=I6l3YNasZO2VbxuJs2gHk4QW6Tep+ft0Kus93/j3ht+jR7aPeondDkkWhnftfmyLN2eQ
	 9Lt53yuKkCkMaWJ7fNSU2SbxDiQ+ugW2UnwUAgxY22hz/8ofDW9rmEMfpNBmAdkRM870F
	 jmbFOFiAtMCUj3+LSz6vommpSjA+74lxcGD6JWQg6T6o+wXClr9HMlPlV+UEXm/qMU/8n
	 YyDozXtc39lm5sIDMFDSxwerljeJ+ZOuJssv7Zmp8EGmmQ39Wfm4yuwm5YkIQo4pr0oNu
	 Vv9EY/PEwqvrxlouXOu7KCnIHT/XRGLOVpeQatqeQMr6H9ReTo67MmGrpF10iYLNk2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqXfStaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgR6STkw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8C606A333
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F8C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VqXfStaP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgR6STkw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtPB03348728
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d1ntf/q0XoO
	vro2JpKmW8goo34C/1E6I72Zm2anXLS4=; b=VqXfStaP0M0uiyuTOYe6IT+O1SS
	h0IofaVGjPN3WKApu6ku71FGlGyYiQtLlxhNmk2xEIQlsivOZRSo5DEbEW9I/xtt
	Ns6uFJyMtN8p15wPOku4AgkQBXoLgNhdQE5zq9k+oRDTDwhwTbR6lTNEkakJpzBu
	t49gbhuM4IcoDGqzyU/yf3rskIZFsWLLnX7DgTfGk3HWf9SsYZJMTGOhsRg55ay7
	zJjFXXV9de2hdgLJiodkSFm/l+JBh2UpH9cDujJT19U5ocnflkixYQgFspeuKecC
	5kamEJ8/BzMGsYRMhyxrMjZmtuaWbC/4QKvh/B9olben7C0DxcXfkYey2IA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xr32t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso825095285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020719; x=1793625519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
        b=dgR6STkwpFy622G8ukK+Zp+OVPfl/nsil7i9XGoOXQgxhko6IrtArEWPqHTTOLS1rJ
         Zb+whEVEDM2YxEgfwHbv/SD25UmrOuXelRYb2uf07qUUkhWpdtq5I83+uKWKPWJ67SV/
         4KuyvQM4thc5nZwW2EDXMK5gnTqG+XKG/YgZfadJNhtvuA8qGsl9Khp+c480I25QMvxn
         zWsjUYehz0xtSJmOXWP6rmmHk7maI5raYgrS0bcqX9v9NFsVQQSqPh3vZUMSDcHcTvU6
         WF9zBmvmkip1jzRzdKGQsf9zNdh5Y/OpAIe5WXzebbSqAdG2HB68DcprU7GuP1tt3azC
         LagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020719; x=1793625519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1ntf/q0XoOvro2JpKmW8goo34C/1E6I72Zm2anXLS4=;
        b=AaybLXrwEweTRCOn3XLC+hTI5vSP2rdhuoSCDrH+VK++EnJFgSwAMzCIDI2bJFXVPQ
         Ojzpms0c8C6b98v7Eq+0pHkJ2CLx8xykDumHhnv9B1SdT+5xsyJ6ncvyCBMWubnr/NwJ
         WS5IMRTpgsS6NLElRLAZ12ufqLLl61b8fsP2NbtuU770chTOAd4vmSEqzSC2VlsiGTjl
         CiCmmH+YGjt5ryHb+8KQLXJxYXV4kT4xm9T68kEdMUQSel4AvC6moopYRjdxzNxEFHV+
         uaqibO6HPcOqDbmcHeoxmObTV3mkPrQci4hKHecXNk5zvUc53oq0eFX2SByNr8tE9fod
         z3kg==
X-Forwarded-Encrypted: i=1; AKwUvByGIt9+1YiqcZBjiLs8njbj0LvZTHmCmPYaylzCGJYA6St+gJmnHdIs81mjqeCEzZOJMnE+vQhkiPOitSFr@vger.kernel.org
X-Gm-Message-State: AFq9FYLvl3dsfyDH0BgpDTWbaQUMXcSV+e7ISU2FOpik/JGajaaxhiZh
	WqEQmcyqpq55hdmIuogze588/p9Dkxg/8WOdPnitQbBeGQlPZqK9GcQ9R7Xv6oZTx1XD9vxZCwJ
	8+Q1V2/YnHRXkBhYZklYbx2MnanNvgq0OwQVufY2d2r7ayFAb0LjQqlNY0gtbL5E4pf0s
X-Gm-Gg: AYBFou339sVy9jxSECknZBhNU/CjP2rvDv5SfoxSJYAdcQwb0/ca8j6fyzlfHC+KVV3
	5MnuKNO2NZimSS37TOg4jYNaBgaTbTu/CY++R0cy0l0ppQTdng8RwxjQY5A/I6NqYoaldgwnFNM
	b5HSSeBQD0ec5Zw9dOGzGxtnFVWkdLrQ8Q9tg8ZVs+B6H3bplfo5qkZg3TskqZMXjlN7Q/+HJ2Z
	bhPyuPaXcI8eHux93h1JMJqjU78jz4U/bTtWRtNlqyi1iOWB3O8kjJGzXnzdYJkic1+mMlI841J
	K3XDqewugt1d3whpXXeIJSfi1tyLwHvjAPCKSj6P84u6ffG4Ttdm2pPSHw99Yu/lkJ584QBZpP6
	NMb6dSvaeUVZQCDAQSl+eHGIS
X-Received: by 2002:a05:620a:4ef:b0:943:e872:f521 with SMTP id af79cd13be357-943e872f5bdmr325824585a.9.1793020718689;
        Mon, 26 Oct 2026 06:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4ef:b0:943:e872:f521 with SMTP id af79cd13be357-943e872f5bdmr325821385a.9.1793020718181;
        Mon, 26 Oct 2026 06:18:38 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:37 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Mon, 26 Oct 2026 15:18:32 +0200
Message-Id: <20261026131834.3247963-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-5-atanas.filipov@oss.qualcomm.com> <4d01af69-0942-47a8-a1cc-be52f520184d@nxsw.ie>
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
X-Proofpoint-ORIG-GUID: GfJ48v0je18FHKRXWJ7ElIE8R4KPt5gc
X-Proofpoint-GUID: GfJ48v0je18FHKRXWJ7ElIE8R4KPt5gc
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf532f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=cPx-3dMFXJ-tvbuS-X4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXxNgX7OTKjnOk
 K4Fix15Ad9L06Ker1tcq25iIu1FSQqEnXkN0fk0wPWL/w5D4UmIolXifTX7W8Ti2XDZHsdKUeQ8
 eVd6K8/Sa9a9HKYWUx75sDvRI7NsvFU1kYKt7UgSP2CsJu31nuaZSPOu/eOEZDN/+oN058AQ60j
 9GZcFCQEaVGK1rUd/9vdGuRbWSXktyGgQ7Iwzrc+9+90yeV6C0tSEKrgTxJtZ5DeFNeHJo2JFWS
 rNxPWmmZ1J5zeRp1Q6fIRBOlq2jdjxLjRTxI+eCNkiHWE3sspbmdalHZUClnA5YB8jV7ls7w9zz
 r6pdjdeEaWDU1ACqJLh4wiLDpnW/gebmhpvrgiiXXCqfpPqZJSk8yMlFmo8g99vY+bGxqcFv0iD
 YGTiZcyHGAk9l7BCyJVYXCV/ZID0CGwXlTjB4C+NlYRQvCzBfADGpKmUkcUEDAcVXCGnuDU+KVR
 uMe8ITdBDcjpCSCavpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX0nupBbPvXeX+
 sE50cMK++j7ho+q1S3D2dLIk8nsymudUnGIzgSF+zLJ58nRKrfz0rcaKb0Pfizz5DivFFuO/iMi
 QwQtccxJne82y6MNahmE8SqTBVmQyIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:13, Bryan O'Donoghue wrote:
> clk_set_rate_range() is a CCF provided aggregator which will allow a VFE
> or another consumer of the same clock to set an effective floor -
> without having a driver-specific voting framework.
[...]
> On release, relax the range first and then clk_set_rate() to the lowest
> listed rate explicitly.

Agreed, v3 will replace the clock domains with clk_set_rate_range(). The
VFE will set its rate as a floor in vfe_get(); in vfe_put() it will drop
the floor and set the lowest listed rate rounded with clk_round_rate(),
so that the result stays within the floors of the other VFEs.

Tested on RB5 with two concurrent streams on VFE0/VFE1 and on the two
VFE Lite: the shared vfe_lite and camnoc_axi clocks stay at the highest
floor while both stream and drop to the remaining one when one stops.

The floors are aggregated per clock only. The AREG clocks of VFE0 and
VFE1 are two clocks fed by the fast AHB source, so the floor of one
does not protect the other, see 5/6.

Regards,
Atanas
