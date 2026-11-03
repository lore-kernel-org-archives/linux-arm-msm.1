Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699808;
	b=Brq3JQv4V3qCzv//ZeTgFe4TKFrK5kz+qdl9OwwbVcXzIN2489uzZqt+G1eD/g03h3od
	 hVuP2zUMH2dro/wvua5DRTTAZoAuJbDv9vhp7fasSmDNIKeyIlprWHV8NKhUIWdQlTLaX
	 JWr+nbivOEWsrOF+1wPmOPETLCD0Q6278ZfkPugUZ2uLr+lxFjCqc02pEYvnCR5ZC0PwQ
	 67HatUibTOo3gU7rIzAWzH98F2nJ308ayAaWcnIbN+2dqYBWNwxTmzkJPKyA2xkUAbMxZ
	 cgvu4ecF0cRqyJI/QiAAnQrUS4uw+/mxYZg8T6oPvyG/whsMHkbICyUTajx43pLJmBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ifhjCVZVvtRk/0jKZlaJa9Z7ofZnoDnw22mCyuV304=;
	b=Szea2D09Vccb2ywQDFF+01PAuo9Scsum12s2+Qz7t+6vx5nMOPEpoNqWdgyz/NrxkF3E
	 GxuQGoed4FdAiK++F7Kdi4TJ50ix+9fV80IBv+tyeZdtOboRmDX5rS4zdpZ/uoORZM7VD
	 Ivm08yzjIv0bEyOKwrc5JYbdGikeHmaYxsZHvqn7Q5pjRj+OFmgmJ792LBsk3+hYV6h1W
	 uwp1pme+tetmjj97g3NSc1tA+XeebJqAY9TYufYHPjcAc1md1D9P/57hpNWT3lj7cAHBq
	 aIauGE7DfMtybBJRvUwm4s/3elKwXcRN6hJJvm0i8qwrdV834NeaM+MdsE8lQp4wL/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Us0N9EgN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqIa33oa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C060A2629
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8C060A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Us0N9EgN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZqIa33oa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352kgm2448997
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ifhjCVZVvtRk/0jKZlaJa9Z
	7ofZnoDnw22mCyuV304=; b=Us0N9EgNjX0M802Yq0RrxyEGHcgnAt80KJ20E36S
	UYK8qNIGMo19dWqP2BJ+tHiw5NZs1BqsB1Xad/Yjafu2HDDwF7Vpiv7c0gXFkxhx
	chrraE6/UEF5BaDORw3CycD3Tqkw7B1z5tb4sC19GzR5yVkwmD6bcSmLglGMeRhT
	uC0NEtv7PwUjvEqt3GuXW93F04LliAPSbutq2bWp+Gfpabd+MPJMedxw8WRhDZGZ
	3daaKDrR2EnVimDa6QFyPhpk4DTb2Q+8vAOHcuTWJoWtAPnsShkYFCIjKZ737zys
	K7ShMRFz6aXq2Krwqke4o5FkW7XVnbxhh21kFBVrIuK7JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs47e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:56:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so738559485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699806; x=1794304606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ifhjCVZVvtRk/0jKZlaJa9Z7ofZnoDnw22mCyuV304=;
        b=ZqIa33oaU0rM4zp3wrrLmympfOxZslaifpH+eKtANr5s4zrhZrLLM5rabfQ9JcfQgO
         +x21vkuZIwVW8CVZeJXGnz2/L1p3JfdLDrM7+coOa7nkhvy/JojXjROaXTGDtheNnjoL
         CIJpXniOuO2y6NF5YflXKSURaGbuGyoyrH2q+Wg8UBbGV8TDX5cGCgxwWxS2z+GrceT6
         Zr1Jr7+JMw9rbekZUqQBKJnpgWsVr8cFClRn7ZUPsrL4CUWQ1dfnNvbb5mEVTAAX5Hho
         sUaIZadxYBk2hoXLUMCb6y272qS9hHEytWpzMC2H/HiPh+Q+bPNzN7xsmX+uvkqycWqK
         uyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699806; x=1794304606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ifhjCVZVvtRk/0jKZlaJa9Z7ofZnoDnw22mCyuV304=;
        b=d311MCVX66P5kdzYQngOIoTT+GsPg8mB3h27L1XhBH3gSit9W4cYknujKMrv/+270q
         bfs786M5XYOuVFZuuBr38Cb4LV+gTrVsjx1S4bllyy4vgo/t54wQnXjW/rbzrfZ2KSlH
         nOadMrzrMcb89GBXl+SXV/lCuqzUoJsxnttSvsqc6rTX6Gq8uoE602A7+IibEHOsp4Zk
         WEHd5mlJFEuQlG2qnWRvn0CIIdrf+vdojSQ9F7ZlTXuX2eLe3WlbcNIyRn5ZV1hX+7mH
         wfUuOmdciWjm7lesFllAWcYRGwAlUZRlG/PzYtee0LRoiB2re6YXGEmFa7VuZMtRHfyX
         MD/w==
X-Forwarded-Encrypted: i=1; AKwUvBypbGIWWVpxaOAsQSRNGvxvdTwMK7z/vB8kx2UzNypWWM1NCy4VHf/9HkLKaxypGm6g0w+ovOiksLE/eGl5@vger.kernel.org
X-Gm-Message-State: APuU4Z9I6oTrkZtpzgzGAIpsByn0JW+RqRHHGSZBDsndWXL+xhz3XkKq
	qQh8+jL+8TArquAMxcccgH4oNCGicfjleUCEfSVSEKSzfLGWnn2AcQ7S7v+c8AObOIF6LrY+Mn4
	i53enWL+X2FemLZO12SrIwrlI/Nw3PTeVBNc4wlQzAJAgp0ps3PDNxjmKRY4BB4qOvAwl
X-Gm-Gg: AYBFou2dy/9AxStg3Jz92eVO77aBoce0lK8JBSgKc9i0d8hoGoobpDzx7kVCBvTkYfT
	yo0CgYAOLLYlUYF7RgMGzTLwudW8wNa3km8ypWNR+7LmZBkyANk7KW+PdJuNExuvniH3iWU/ERp
	JOro5eXSQOddKm9gNF3qKMpT6e6eTwL0/90xLoGchVOakmHK6otCPpropZSRpzbH9VTWCrLMxUZ
	b33srKOZaBUjuMXaFdGD48QThME9lu2H7D0uA9sajYx10LL81ZGqda0FnLJwkcfa6fYyGaKGfmq
	pjHFahf9RspeG49/SAy6vKKNmeeitgCsOxFj6VmmzAH+xnm7IPeKeTu10NfyTMPG6fLzpOqy+9R
	eCnN/rxOvc8QXSp/+lzICLkQfTzIQN+TrXLDXKPuhQjUxLEqlIUGJSQqupc2Af5I=
X-Received: by 2002:a05:620a:29c1:b0:93c:6028:6d2b with SMTP id af79cd13be357-9442175b5b4mr2182515985a.43.1793699805697;
        Tue, 03 Nov 2026 01:56:45 -0800 (PST)
X-Received: by 2002:a05:620a:29c1:b0:93c:6028:6d2b with SMTP id af79cd13be357-9442175b5b4mr2182513685a.43.1793699805095;
        Tue, 03 Nov 2026 01:56:45 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm230865925e9.1.2026.11.03.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:56:44 -0800 (PST)
Date: Tue, 3 Nov 2026 11:56:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] phy: qcom: qmp-combo: Separate PCS misc clamp mapping
Message-ID: <sfnbemeazka5o2muhztakkfmh6q3uz5adfmha4vesdnqjf2uto@67n7ay2eymex>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <20261102-topic-qmp_aon_clamp-v1-1-141c2cb6cdf6@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-1-141c2cb6cdf6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9afde cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cGOgi5_NMkWPeH9ql9QA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lQx0o4UFsTjFo2my-DVoSe0jfZCxJg7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX6hu+Ktrs75Wm
 O6B90RQ8fTnauoQfNNzDDdrdHXIjqFUvptOodkJ0JYEeEZvJajCkvBrC1zgIyMB11Kf/VQlADyX
 9IPBQ6o2v1QzHzckXcCY0D7O+/FkH49ehWBBbU1sblit/GQfRqFP7AyGmY26nsejLCNfKGeRQEl
 YnYWTIFpuA+53hDXo07805kow+Xeewzh87uQ5nMm5Q2g5KM5J4gWPIOU+ZUGTpUOe6Ah7D9OuRj
 XkMtFWf8xbt4EaDNwKpr55acONrx4Nmn8KpCgYNwCyHmikfj35qaP1VsnCpKL85PRBwgHW/BFFL
 QJZrz8Gm5KR+sB5u+Zf3Vy0aCggUNHYZWqxhOyILR+bGsjYdnNuA6b1H/TAQB9V7W1WZXwY1Pcd
 Cqa0L2UvUeujY21YDVIdQjWfUOkgOZdwYvBwjdGczTvi0cZcRIVfRgsvnL1FZIlVA9GDYSM4oE2
 xqcWItluC1YSXS3a8MQ==
X-Proofpoint-GUID: lQx0o4UFsTjFo2my-DVoSe0jfZCxJg7Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX45g06gWsknlZ
 KOR0VILQYyZRPAEZDiEdfyDc9McIGLX3INy/k5ScEe25PzGP1U4ntkKiWD5/ktpiwXeKHZjuUOx
 f7uHPDVWIhueEideDHYqcgI2fyRAK0g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-11-02 14:59:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PCS clamp offsets can belong to different register windows. Using
> QPHY_PCS_CLAMP_ENABLE for both the AON and PCS misc windows conflates
> those layouts when a PHY has both controls.
> 
> Add QPHY_PCS_MISC_CLAMP_ENABLE for misc-backed platforms and use it for
> misc-window clamp accesses. Keep QPHY_PCS_CLAMP_ENABLE for PCS/AON
> clamps.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
