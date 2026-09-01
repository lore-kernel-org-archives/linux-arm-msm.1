Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2378D409266
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274022; cv=pass; b=rJtaJ8A6dQVLLvtbDJFNdemOu4aXhxqZC9+AlLnZ0ZRF/Rj7sSTmw2AsvuQyR1LUYKJ6GKmB62r5e23oaYU7iYuoMmU12C2YwcHgdN/cQS3uJkYxGFhTcripF0vFl08d9nIqQTt1pDayT6OZrTBvz5b29p2xZVpU50CBNkYJHpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274022; c=relaxed/simple;
	bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmzGghN8MbLAdnQu51M7KhPY5Mrajt7l6Kwnbxz7JCB/X+YsdAaHzD0ehLw9JSd74Uu8nXQ1unFGTqfxpZm4dY6HG+ZeBA9KLCZBMsBL9nBlKrJZw2fzJqJapZmDGhmZSCBZ5eKWSdDs9oA2roPNvySU2z++SgohoiSs1viDQ+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJYQ3j39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dllRBTIx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJYQ3j39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dllRBTIx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8d4P2910462
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dT3RN5VdEwJ2zJ5PYII/r+JE
	HnQOkc7pAjMxC21FiBY=; b=LJYQ3j39rNg3jWlWWauFXljfGn0CDk4MSMJrmPlv
	L15NtYDyNfvCTM4m3op85ejvzHPlnVv5fmfGigCpij00OFLABTu4XisP7YPYy6Ij
	9/CwakbGQbgKzBmT+ZJTZRpU7Ayr2cP02DMLfqbI7aLeRqAEFwqeFkWEStD70qn/
	aReYSwd/sgFUYw5VU/9KvIm3S30u3taNTCy/FKbU9oAFRgLFhO9zEz3JGIIhqxJH
	hIUyfgxjAALr/cGeJjOAlXCVucSem4oZ3BmP1fGJMmpCSvmqGDLh4pEd3weG6Tjt
	GxBXCVJqfYmlWybdPMpp4B0VPXv4n+L4zyU38VACb+eVpg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2whq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:46:59 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c70d0dd81so6899209d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274019; cv=none;
        d=google.com; s=arc-20260327;
        b=rAb9hwVLCVU/5zDBywyir5G6QkkFmZiWtC6eumH0ZkSyN+npxu8OQo0vcJFl2kHa3s
         exFldSmqNT2LD5sC4AMB5D9wX/z5SwDnAm/KmPi7gZoNnXV8DPdCxrTMa9Rwfs7+vDXX
         P9tScK5kUmfsJfKSHAEV11LGcWG/EKsTTWhpYD4v5QqrKhfYcf/ayea34NCBcq4G7npp
         YLH7c9v1thtRGVgZ9SBV/C8uEd7x/WaTIUtPmKMsDCGyZDCK3ONK9YLVbBBaAfmbJaIo
         prNorqN8bA3GV8xLag/+K3/iS0pUZAWW0kweB8SbwfA60ToKvvPfx2XRw40Kodh5Ovsy
         XqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        fh=vaPwghx2d4nHDRnRN1VEinKq550MayqBxXVHog5ZV0Q=;
        b=rYEx3e54VWXQls+pZ89PZ+kHij+LzRSyxl3duNsOpHCHK/GgTDo7gADdSrXc2wjOZy
         LfTwoehMSS48aSm1NODX0tVN87UOz2gRMCUIVR4NOTAvTtzcUIHhBqAda7a0/ixjE3Dt
         gX2wepHwKCOdKIIGhG3wBfedKLTaMxWXTF11ThVDw+nZCTreXvOmYyZmVmWb61pleLBC
         A7eDgNF6hzSAOLdReEZ0YayML6S1AvqqFtoUgZ3hJXRSRT475HSKC6D9vcAgkIjjJfD6
         UZAGWCxEXqW59N1VAJkh9+adgFZuSGjUxbG/cd6qYgPw+NkqVwdu+RRQApVxwZ3rej44
         ImKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274019; x=1788878819; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=dllRBTIx4NEgI6OsD8au0l3ld558I9KBnwJ2DFs/pHFivbInfGIark1LzbjJQHhakA
         JtB4U9dR3TnwB9K4JirOCaip0rxRR7yJ6H/qWZ323sSsgFxBnAoupVJwZxLlRhgn+HlO
         eP4BOWJJ96pexKHXzdVc5nB+FiIHZlyet0hx9TVvMusY3lC2cFCE/CI4EUN5mxxzN1sy
         0Y4/LEkT/InJDNzFVjsuxtPM42BkjKh4SZ75AT4v+nIevHo2jWfcixf0mkWBk2vR+0A0
         paLPELuGz+hOdCFJurkovB2SwgDvHzqezqWt2cRVxrKeHv5geh/8ZJ/z+MWr/qY2I8d+
         jzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274019; x=1788878819;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=i2KAykZ8fx2EYDDrSyZWSQvQmIrjFmhdPLHB0yoiWgv5+mmr15FXmy8oh7+3uCVOWI
         pGH9Np8JUOwq+qTGjXO9JG5XjdEmD0NXMgBP5WG9yZKeEQ+rGvVE3VhvkNXUgmrSaqMy
         TzpuNQon6tC3XLpagFBFx54tasgoI4f9Fy0wYM3mSoVcnKOUkvFpkQS6pQvk3cIb8WKQ
         ivb2JA8+E3AQliSgnev+TFl4QbWTmMoUJbev+FesfXOXa4HbMX+pu23LTmQOT18h7k0P
         /JoJEFJvB+Mb+HrqVKn6L6FhuGvts4Us1KbGktpyGkd2eB9KqLAkuYRagQEbD/MCTwRM
         NBTA==
X-Forwarded-Encrypted: i=1; AKwUvBwXl0oB2ltyZGqM75RbS6l//nIQlhD1Av9DfX6LRR65FiJwiPwfdsWR3ssmjRKQMJnOakKYOECQT8k8eEaW@vger.kernel.org
X-Gm-Message-State: AFuF++meS5LMcZFSDzJRFKBub0joeItXiziWUALbyFfFLAIK7jyrdh8N
	INj8BFahjUTC/euJlHSZEe1o2NBDgD9BCDbYZIRLSnNVwkmvCHWhOmL/MfWKkJ25ZCQ1Dhe4iJ4
	MLTLwXKsozP2ltQPypOB3wYYX3jamhb/suQA/vW0tAxUJJVqhasBX2JinxNWEwQKwQJxSUWy9j/
	oUHaKrp6tuhiGVnS28/5KV4XG6H75ayLNXBx4ptZraZ6o=
X-Gm-Gg: AYBFou2l/JQ621KwiwlbRiswZBFypTCiUfq2g0YrWT/b4KwNOqrV2BHg5tKny3ydnQ1
	uEY0DylWICpsP4q/sp0kixD6W/Ezt0d7wpETC13DZXuPI9335/01oP2y04XixsXXH6ESI3emhcv
	1JjXH1zhEZhyNNMjmljSPLDmnNpH0JFPSY77ZpexMJHemhjBPCz8naqcKphFM=
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id 956f58d0204a3-66f856546f4mr2647736d50.24.1788274019350;
        Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id
 956f58d0204a3-66f856546f4mr2647716d50.24.1788274018846; Tue, 01 Sep 2026
 07:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
In-Reply-To: <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 20:16:46 +0530
X-Gm-Features: AcwNN1WVNVZF23H9olknWUBf0jBjDI0S1tPmtjMycntbFFHs18PkVuP9uKwJBYw
Message-ID: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96e563 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=ubUB8SH87j9vw69hzB4A:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX1mTVjHpwAH29
 L/OAqglQUjAfmXfyf0w+m4Ang35egwdrcn6VNmbykosLMe2bjHCxjxwpDgiwkJsWRDhGa1Jdy9e
 p7qmxMEZfi3B0jCb7VEKwokz1qQ5R2czY4pPmOy1JsTOLd2hOklL0gU22p6khtAD0TDTBBciSxQ
 ow9yt02A1QX804kqndGR7YU+R7BJd2OX9GCH+YLn8VK+N49xVaidhiHzioRyF7pvSIYdKcCQz31
 1QhJu4qTa3tp7baUGAmjte4aUYMUy19pqbsRJX4eK6YO7ACJyyDPRGO+6JDZt/jyZhAaVpJE8nq
 2BbGUw4QQVXJTw/dX54fRAbg9Ni9uQyfdnrWZagh/Jm95fy0It/MsqXlVpH8XKX86JlqGqZYi3P
 KAmArrO/LSW+c30iQBiS7PVd93fv91B4VabFEt5XOlGEx11j6yuoZHQKY6de0HLhBs3Cu4RxCsS
 60o/PGz4raU8ldt5/IQ==
X-Proofpoint-GUID: etgKic0vvmZc5eVi1hsH8WtD_fdlP8fD
X-Proofpoint-ORIG-GUID: etgKic0vvmZc5eVi1hsH8WtD_fdlP8fD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfXzUF6mtzZ7mo7
 SpfW3r12QrxnRI/snsNtfB/jF2W2hd6THMc03Kmh8xw/cY4hwutm2hqkwbX/7tvcNGfRR/rt1mv
 8iAWLEi2gyqJRgDz3p1elxi6nVyZ5m4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

> >> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> >> Usually DT binding filenames are aligned with the compatible string for clarity.
> >> Is there a reason for the naming mismatch?
> > The filename reflects the controller; the compatible is
> > variant-specific. This follows the same convention as
> > qcom,lpass-cpu.yaml.
> >>
>
> There is no compatible for controller and the only top-level compatible
> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>
> And I already asked about this in v1. Why does this have to be repeated
> at v3?
The QAIF hardware IP is the same across platforms, only the board
integration details differ. The binding is meant to describe the IP
generically, with board-specific compatibles like qcom,shikra-qaif-cpu
used to distinguish variants. I had qcom,qaif-cpu as the generic
compatible in v2 but removed it in v3 as I was not clear about the
guideline. Could you please suggest the right approach for the
compatible and filename in this case?
>
> What about other comments from v1? Where they implemented?
v3 carries major changes in binding and code, which addresses all the
previous comments from all patches of v1 & v2. Requesting you to
please review v3.
-Harendra
>
> Best regards,
> Krzysztof
