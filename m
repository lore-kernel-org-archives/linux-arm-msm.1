Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612182;
	b=FhOvDfMDe2OD6SA1brCEgl6DkZELxu/oJYr/WfaBl1cY5K5msG1QizoOLpoIDv4P2WJz
	 HTnDPttACMvZROLUftRN+dZ4Nhfzt3yNw4WbcRV5istmJ0XSHOikjb8R3BN2GM7wCt0jx
	 XdAqOC6Or+zR7AgFqyaoN+DfB+u49I3N0MN+2xEY+gc4sLm7iJHdm83Q8OeCOaflQZ0Uk
	 cAiefH36VWadBA35Y8zKg89660Ay5nyqjqCWo1X/uObZOFOtmPH6eHRnpM1SlaBCkJw57
	 8qssgNMO0x9safYn5ewK4UlGKXPkVvxjpVoJ3Uc1qqlEdhsS7nPKitcI4V8IdAiTLQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2EHKdHn/evGY492frENpI73JPa/bXks6zV07Z8DP8Pw=;
	b=gyXDyFX0UWoax7eaii3tGexFzwLfhI0L+asgmlD/9a+KCLeK0P/pu+cyJCKGyhzD2Ip6
	 r7BWWLs4nb7zHcr3k4k7Z++hlCJSaF4fXz8YDgYHxV4mk8XaKVE9/oRF7yTqLRRfkOH/6
	 HqfnkCRgPxu/ArdDnBWvhzLjXhigW1Y1sml3tMQlnWaig1O9Cfs3xmfziwyru5B6xhtTG
	 VYk0MYd20DVYewqxg0bKgDUJi0tBYyaizabvcI3CN/SpGl4OHeR6RMYOHVZhQJJ6B6Hyn
	 3eNFGhoy/go3tsDGh4gf25vLrV7EZFCvPCtTvY/EfZLc8bQBggM7rFZMVP65dEjAlgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vYA1hCDh;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43F606A699
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D43F606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vYA1hCDh
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3316378f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612180; x=1796216980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EHKdHn/evGY492frENpI73JPa/bXks6zV07Z8DP8Pw=;
        b=vYA1hCDhxbqq8jX8v6q4FvQcD93zZWBJJHXYAYeBP5c2mK3U3/hl2LnFmPwyROHNtx
         6DpZbwAlederrAA1sq4fYGgBaDqHKfjoouMfKijW9rJgbMtkGyxNsgB4smlJaPrr7XL2
         pR0fBbTDILsqlBU+c9HSs/N6fP1nWaer+d3k9yXQYBT09TjuF7xQt0SZ+YQHx653vZm+
         /2CyEzRkJMCv/X8m1CewFLHq7IlClY5KIYexjseoa0seYGoqzpmku0CTSZr8uofgXoML
         X24RIES7iNZ389hc18/EzFwaFHZzI61Zt9nQIov3trM7+JCJSPUrCJ4Z/ybmLLTeNaSR
         RRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612180; x=1796216980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EHKdHn/evGY492frENpI73JPa/bXks6zV07Z8DP8Pw=;
        b=M6b75iMCQn0/rUmpp1vZsngGRdNxLl3xhVDGE80LAYF005pP0vi3zX5xmFLRtO+7cf
         l/obPjo8Fyvkh5SgknBmmMSwV5U4FRT1DqupS9h3dxuGhfrOin6At88oaqoPP6cqDsp2
         q9DCqq/gf1Q31V0WJzt1BYqHuZIXfeUBIPpJmaomJogNHyLpCbhrto63Ed+BsdRRpQK3
         hTBydhrJnlDzyygIQoMka/CJMV3IoayN8seCpYTxNpBOT0BjZfZ7HlIOQgeTN2P0uxRB
         +vBOfeNcPquG5IFz/qCd4yDg0vBaoXPnoi+p7qbcxIDyDYDT7qDft4T6+LTRPhjgSMHC
         PwUg==
X-Forwarded-Encrypted: i=1; AL+hErFKuNsv9eDdclBfD3/Y/ullbhmp/pcoVeMsiC9pLFC7b+AbJMMfOgAtII0yVCG1wxs8C3IYVBFc+e3Ulf9T@vger.kernel.org
X-Gm-Message-State: APuU4Z9rSvh/CR91T9uIYBTAV9JR02fG1DTB1I4K4dtPMjDBwNE1wxli
	R4pGSbXWXjenw59UkEZ43BvjJJvP+m7Tv+HKlvXV7UV7L0kO3KqTPClX/X9UcGum/x8=
X-Gm-Gg: AZFdTZc9wptn2cOpcCFh3R6dhU8O9QZmb1kuHPpZAlRS0To4/OWF2PCuUOVjnP5TmmT
	DOpIryh6QvChEPCgMEpk6v4iI7h735iGi2jlLUWhnf5BhHbOBxljwoVdjodD3LMV9JQvQcawAjf
	AFWztIMHKXOI27El4SRIc5pgvS7YLYJSoYpqsPsaHi6mFv5QRhoaVcQ5hKUlHRDpzK0SopRhsuA
	9Dn1A8BaN4nt6pAukN0kkK9Sf5ZvqJXZf/TmeMjxPRaO7kDsinDrUWNLmUjSeDylMvl/70ulD38
	6XoUH4rPJ1FR+tLSfbrNVPUF5RkwZ+5vyhpEloZ/CIDwsCKpBtCV+CfPCVdGJKEMyNoKJmZhs9Q
	azbJql/Xp+nina66qORWCiNwOt0FHLq2WSvwCKqIUNtdxF8xHt2zVcFT9r/y5S7ZFPh3C+3sX4m
	i+IylDHUEhBxIgoGgPWmVtlIqWufY927iKX8f9oScrQPTKYv4FvVMuEkW7LH3pWzcQKbOKZTkJU
	XxRPneZP31qQVZqNTvfs/VEBylBenDa0IkH9OBVRveqDfgSOG6QTFTpRAh7SKi4E/EnIhCVPRCS
	ghPe3arkCDDj5J2V46cx02uD/pVhQzw3pvAai88kvXfRzC/a/w==
X-Received: by 2002:a05:6000:2903:b0:4b7:70aa:4553 with SMTP id ffacd0b85a97d-4b770aa4574mr10550337f8f.38.1795612180312;
        Wed, 25 Nov 2026 05:09:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:32 +0100
Subject: [PATCH 05/11] media: iris: clear the stopped state when the
 decoder resumes
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-5-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=f3feV/1DMgSfL2CmzIHAP9+r71wRu+v9Ez6CcCCVkxs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4MfTtWqMX7j9xdtH+gM3bx8COMHUn9f775o8YT
 TYEMpjOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDAAKCRB33NvayMhJ0SZrD/
 4896I7D8wrXyxCNszgiSlEvqG7vrw5O+eNY4f+lErpVTdGJNplXM7tNsFXj5fzdfa9v/mpwpGLHTSQ
 6Q3zojETOdDH1osgRbayKKmlzjl+mQwxew7O/FSEeGOhBu0BBh8h5kOT3O9/Ui5d0lqG83IqiJdBxE
 40guhE2NyR5r1WJnBiawQqddxDogbkFw2hqoo0GMn3GB+OOoGQzcZS12GKl9NrtjANXcTHfJchJ4Y2
 cDDjj6QjdkCHgYbs75rrmCS1UN3cOweIQS93ro1Ep0bxuwiIaxOzP0i3dlRRSjsrMMJz4c3yT1i5as
 yz8RA+Qm+GeW9atog85dadQkIHVy6Vwt29lB20S5ROxFEFDOJuDLb6zdLiHGVW2Pqn7U0UC8TFsjIC
 9C6BxNz+5Tbc7wKAypjnBwNqDvz1XFKz2TwFFdAu2u8T2XJOwL+6eoMJNqK0NgG3Z09Lmu8G15Mnxc
 CtkwMoTbDerlvAeDICg3LxMMYsoxxUs9rODxDjfaS83GKNsmqaa0zCi2AI4x5dg+pSqTb1wwog0C96
 aS8TC4zKVbK6YYEVPzNcyy4cWJeSuSif8DSJVPIQjEUOsazUmq7frVCD+4QEargK1fn6Aqk3VrKaYz
 l+RNoIIPtVBZ9dFlVJ435IIdY/Ho79qNx/bcFTJ6oHleSQ0EwKjwBGp9vaHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

V4L2_DEC_CMD_START resumes the decoder after a drain or a source change
but leaves inst->last_buffer_dequeued and the m2m stopped state set, and
STREAMON(CAPTURE) leaves the m2m stopped state set:

- the LAST buffer of the next drain or source change is not flagged on
  gen1, and iris_vb2_buf_queue() does not return one either;
- iris_vb2_signal_eos() does not signal V4L2_EVENT_EOS at the end of the
  next drain.

Clear both on START, and the m2m stopped state on STREAMON(CAPTURE),
which already clears inst->last_buffer_dequeued.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_common.c | 1 +
 drivers/media/platform/qcom/iris/iris_vdec.c   | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 25836561bcf3..61634df56797 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -151,6 +151,7 @@ int iris_process_streamon_output(struct iris_inst *inst)
 		return ret;
 
 	inst->last_buffer_dequeued = false;
+	v4l2_m2m_clear_state(inst->m2m_ctx);
 
 	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d35a1eb62d30..6369370a04a2 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -584,7 +584,14 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
 		return -EBUSY;
 	}
 
-	return iris_inst_change_sub_state(inst, clear_sub_state, 0);
+	ret = iris_inst_change_sub_state(inst, clear_sub_state, 0);
+	if (ret)
+		return ret;
+
+	inst->last_buffer_dequeued = false;
+	v4l2_m2m_clear_state(inst->m2m_ctx);
+
+	return 0;
 }
 
 int iris_vdec_stop_cmd(struct iris_inst *inst)

-- 
2.34.1

