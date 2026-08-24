Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D93E49E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553174; cv=none; b=Bz53zlFy3XIVKLpSMFQxJSvA2MOJiGcDwdNUPPNAxI0cLZxOqdcficMS0qIovqoGAq4kuMBxRYCdiEf7Mn8Ub0d3r+CjEF2VF8s+ylZeJ4V0ozTV0K+tU83QiU7CXpx7zNo6U+zm5SzLvUFdOIMWo8SKBzf0OAnipvV2OF4D3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553174; c=relaxed/simple;
	bh=syWg8sLJMiMY3ZnaxoaIqM1ZIb7QIUvi5ZvMkQfPIrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POjaKZJ86WaGul9TNZIAf7Bbp6A97u6fLailBepjsZn4zeM13yF+rY5Y/vJ5gny0KbhRZOkU6nulPoK1xNvi28v5OeSfNmRV1WdRp+ItOHGakrIxHYsFHzEyz+cnTat3u89RD4nxpRd5xI+5k16RnZBL636F/HVb1Q44i+8lOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQkGXMis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7z+lFfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQkGXMis";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7z+lFfd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6Sbxd1982460
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=; b=cQkGXMisLAMbwHrA
	Pr/3HK3FygWdY7riRf/M1xY9oDlCJmpiZtCmr7JvyTiJbPJJqotlW/wq3C2XaIxx
	996HTlan3FvrWU3oJtCaq8p/KmwvhqfrXGcHK8qm5Gv/fLxhnOBaEyD07y6LqMAc
	pu+JI4zG/b2ZgtCAEquz1Kk1qCCATdHqBXeowcNqb7oOX89jYzlyScYF+E5cPqs/
	dx6wK4Fp5piDCAAlnI9PO1jksfGQeLkVry52bZSWtMVOYJyHPQVlaytiR19E5pYr
	McGtI42e220nul5taZs5eCb7JTmdlAFpkl5FZBRpk6+wPmgeT+/WmT4yu9ZR1FnG
	ojyK4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn80m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:32:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5644071cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787553171; x=1788157971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=E7z+lFfdU6P64mvjwXMVg5bs8+57tIEnitqEI5pqrCXSMbCutHiT+dFrgqaV9SqKfX
         9VsH6XFwXtjUtjVVocdf4UUA9IVN3bQP5SkkzWewXpgdcQlLv8QMFnH7ZRGDBpFIWMV0
         Se+LIXqXqOu0zf3pDZBGHTje+hr5wUVNbotQCuppc2TXv2dk8nNOOHUnfadiMbnuV3tF
         8zcq/Ib8MP9eh4V3a144B2ZSuepfxKmMALVufuZ5bKfL4rPBnpMfu9qRaEwtJa4rEsXd
         mP8ukyMW4JKgpzRLnobmsLAdSaVjHRBuwFvg9Bu/2YcO41hEkiM4G8SxfxRu0BC384fn
         bFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787553171; x=1788157971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zsWuTk19AfEdQatolBnlwSa9JrBBEN3NWLkZB28HQ34=;
        b=GMVI/A7Xw5nZjd+Xuo3Pe9kENv8u7ywtPAoeTcEEiqDqYUX2+DDhMJtWChN2uKHmmc
         vpWND6STPHrD07k407M61n0xZMX9/9h8SwxH3ApnIuoJP1Vs34CexVNhCsECNT+uROFS
         Ri0F85eYmpp9J5z9IVGc9ciFWbPI9sHXrM4aZToUe+TkOhzoUNL3x6WGXvrnSREhcINk
         M9d45HfI15pvi8rgCimu1g5WUDlrWLPA317yJ1L5xnj10WshFCbpNH9od7cqmv4xvKCx
         voxz50vHb99yF8IMbmQOsghDEypDw4A7j+lQ2OcLVpAyQsHK8OAo9ufFx58ufobCRxZw
         vIhA==
X-Forwarded-Encrypted: i=1; AHgh+RpqDTANi/UneUgMMREUZS8+w6QsEu/o5Vu7HOaaGvBbzOy8gGvuxDwJLRrpe2FsSWqezxgZKUNSejF2N9Nn@vger.kernel.org
X-Gm-Message-State: AFuF++m0s4gQWCme+8qzbvuU8d9YMIpxVym5idjvs42J8QhkE6/FaPDL
	+qbY7Ab5f30bHr8YWZgdB3RpcE7zZh8E1mdPPpmoWoeZRo6eQiHFSfBQb1DE+0V+ZWrbcHIPCd6
	B8IKBiRZG5TUFvV1HjQqbBAwNI/Dq1mEh0iWYZ/4JT0bSOqZFq+mCJmnUxA0Zv44dCby0
X-Gm-Gg: AR+sD13nft8nM7SjAa6AY341YcCQ/EwXQRc1+aakOFUFabsGlmGv5X//5c0T1C9weJH
	rt8T5Qd6IPXeVrNGtqfIqsNv14nv5juSzH6bQibPsNiBykp0TC7p/wA/GtGF7M6mvu4/TfG+se7
	ouZeulicqV5lK1LpvhpQe4nUvgsRpmjlkakVb5v1yWq5xvZ1CvH4xfjr+T8Dyt0conAu2tlqSwY
	Qc9xNHjAHwMRk2nItMzYhD+cLrLoewzzm1Fb5eLLlXxHwqxSvdhJNClVLo8zR41Xw94M+ikwmA0
	ZsMhYl8AQCt6ZcSfAO9x7y5yGJSHhwW8e3wegSAqUCl4tpQZ06OBzCekVBNxLWOTtOELSuQ0oc9
	LXrElp+CsK8c9mb2plb+QxG/H
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175224031cf.1.1787553171085;
        Sun, 23 Aug 2026 23:32:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52df567630bmr175223721cf.1.1787553170623;
        Sun, 23 Aug 2026 23:32:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a2183sm1060232966b.58.2026.08.23.23.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:32:49 -0700 (PDT)
Message-ID: <95de411b-0b6a-44e2-b343-fa557a917e9c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for second rear camera
To: david@ixit.cz, Alexander Martinz <amartinz@shiftphones.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
 <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260822-dw9714v-v5-3-502bc7f43b8f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX0BQN0hkA/F3N
 Df+9+9M1uzXGSoJVUMUigUO7L05IZT31DvUv0CxiLviN5TmnlTkMcSlzERfLzvoJsWxVUqu0PXO
 PPYX0CPMYpPtawQbDGkUyl6lzyJt7oA=
X-Proofpoint-GUID: HsH94OMAAe-6Gyy0ARpRx3K6nUiYX-5l
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8be593 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SGxFASbRf4WqgnW55AYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX7dXoyn69KOyc
 vf6q29s12vYW4SDjQY50EV9eq/TWi4+mIvubhorWjZgQB5llRJ0maRSIy+SHVgGCmGbr6h0AGvl
 bJFKVdffEmSBDeLGXaVR7HuTibNOH6pw+ao4UgXlGGBq5/o7SNVo8OUfTpeAq9Ub70fJlyKvCyU
 3pgHg5QJ8jsoHn/6aqRs/bVEPrcTPtMnk8K1Ra2+Bku2NVH7vt6lVyCTIBWtH25NuY8rfEnLfV5
 464fwd3xXZ+Uwn+MyfQ645UMHiBgoJOu2oRPJR7oP6IqU468hbqsbIEpBi0MG8dQuhNeJmk3HTq
 DJOjacUTi/esw4arTwbRw5Ry5dDj5Ju6zKS/G36aVt6N1MFzeyld2iBKK1mHCzRJVRhSYxk9Kwh
 lGkNrynD0mWUwPohCJ+uo9Nc0O7h9GcrazSgdO7R+Mf2rb0f7CkrxWeXQNG29+Avpj8vVy5GqlO
 mqTiN1WuXNdt5rDAhKg==
X-Proofpoint-ORIG-GUID: HsH94OMAAe-6Gyy0ARpRx3K6nUiYX-5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240055

On 8/22/26 7:15 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The SHIFT 6MQ has a second rear (auxiliary) camera. Its autofocus
> actuator is a Dongwoon DW9714V.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
